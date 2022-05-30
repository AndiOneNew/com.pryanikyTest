//
//  parsingData.swift
//  pryanikyTest
//
//  Created by Илья Новиков on 27.05.2022.
//

import Foundation
import UIKit

class DataParsing {
    
    let response = UrlResponse()
    
    func parsingData(response: @escaping (JsonModel?) -> Void) {
        UrlResponse().response{ (Result) in
            switch Result {
            case .success(let data):
                do {
                    let jsonModel = try JSONDecoder().decode(JsonModel.self, from: data)
                    response(jsonModel)
                } catch let jsonError {
                    print("Failed converted JSON:",jsonError)
                }
            case .failure(let error):
                print("Error:",error)
            }
        }
    }
}

extension UIImageView {
    func loadImageFromURL(from urlString: String) {
        let url = URL(string: urlString)
        let requst = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: requst) { (data, response, error)  in
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
