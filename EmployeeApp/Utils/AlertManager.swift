//
//  AlertManager.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 10.11.2022.
//

import UIKit

class AlertManager {

    static func showAlert(title: String, message: String)-> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .default)
        alert.addAction(action)
        return alert
    }

}
