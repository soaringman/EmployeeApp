//
//  Api.swift
//  EmployeeApp
//
//  Created by Алексей Гуляев on 08.11.2022.
//

import Foundation

final class Api {
    
    let baseURL = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    
    func decodeData(url: String, completion: @escaping (Result<Employee?, Error>) -> Void) {
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Ошибка запроса: \(error)")
            }
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try decoder.decode(Employee.self, from: data)
                completion(.success(json))
            } catch let error {
                print("Ошибка парсинга: \(error)")
            }
        }.resume()
    }
}
