//
//  EmployeeViewController.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 07.11.2022.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    //MARK: - private properties
    
    private var employee: [EmployeeElement] = []
    private var company = ""
    private let networkManger = NetworkManager()
    
    //MARK: - ui elements
    private lazy var tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    //MARK: - life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTable()
        setupUI()
        
        getData()
    }
    
    //MARK: - private methods
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: EmployeeCell.reuseID)
        tableView.rowHeight = 100
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
        return self.company
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
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

extension EmployeeViewController: NetworkManagerDelegate {
    
    func showData(result: Company?) {
        guard let result = result else {return}
        self.company = result.name
        self.employee = result.employees
        tableView.reloadData()
    }
    
    func showError() {
        print("Error recive data")
    }
    
    
}

