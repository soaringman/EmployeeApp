//
//  EmployeeViewController.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 07.11.2022.
//

import UIKit
import Network

class EmployeeViewController: UIViewController {
    
    //MARK: - private properties
    
    private var employee: [EmployeeElement] = []
    private var company = ""
    private let networkManger = NetworkManager()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "InternetConnectionMonitor")
    
    //MARK: - ui elements
    private lazy var tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    //MARK: - life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isCheck()
        setupTable()
        setupUI()
    }
    
    //MARK: - private methods
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: EmployeeCell.reuseID)
    }
    
    private func setupUI() {
        self.view.addSubview(tableView)
    }
    
    func getData() {
        let api = Api()
        let baseURL = api.baseURL
        networkManger.fetchData(url: baseURL)
        networkManger.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension EmployeeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.company.count > 0 ? self.company : "No data"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.reuseID, for: indexPath) as? EmployeeCell {
            let data = employee[indexPath.row]
            cell.configure(name: data.name, phoneNumber: data.phoneNumber, skills: data.skills)
            return cell
            
        }
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension EmployeeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension EmployeeViewController: NetworkManagerDelegate {
    
    func showData(result: Company?) {
        guard let result = result else {return}
        self.company = result.name
        self.employee = result.employees.sorted(by: {$0.name < $1.name})
        tableView.reloadData()
    }
    
    func showError() {
        print("Error recive data")
    }
}

extension EmployeeViewController {
    
    func isCheck() {
        monitor.pathUpdateHandler = {pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) { self.getData() }
                
                
            } else {
                DispatchQueue.main.async {
                    let alert = AlertManager.showAlert(title: "Проверка соединения", message: "Интернет соединение отсутствует")
                    self.present(alert, animated: true)
                }
            }
        }
        monitor.start(queue: queue)
    }
}

