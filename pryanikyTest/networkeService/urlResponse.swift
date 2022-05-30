//
//  urlResponse.swift
//  pryanikyTest
//
//  Created by Илья Новиков on 27.05.2022.
//

import Foundation
import UIKit

class UrlResponse {
    
    func response(completion: @escaping (Result<Data, Error>) -> Void) {
        let url = URL(string: "https://pryaniky.com/static/json/sample.json")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return }
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        task.resume()
    }
}
