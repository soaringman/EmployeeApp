//
//  EmployeeViewController.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 07.11.2022.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    //MARK: - private properties
    
    
    //MARK: - ui elements
    private lazy var tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    var networkManger = NetworkManager()
    
    
    //MARK: - life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTable()
        setupUI()
        
        networkManger.fetchData(url: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c")
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
    
    private func setupConstraints() {
        
    }
}

    //MARK: - UITableViewDataSource
extension EmployeeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Avito"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.reuseID, for: indexPath) as? EmployeeCell {
            
            return cell
        }
        return UITableViewCell()
    }
}

    //MARK: - UITableViewDelegate
extension EmployeeViewController: UITableViewDelegate {
    
}

