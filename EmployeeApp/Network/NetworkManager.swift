//
//  NetworkManager.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 08.11.2022.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func showData(result: Company?)
    func showError()
}

final class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?

    private let api = Api()
    
    func fetchData(url: String) {
        api.decodeData(url: url) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let companyData):
                DispatchQueue.main.async {
                    self.delegate?.showData(result: companyData?.company)
                }
            case .failure(_):
                self.delegate?.showError()
            }
        }
    }
}
