//
//  NetworkManager.swift
//  PanopticAI
//
//  Created by Rohin Madhavan on 20/05/2024.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    let baseUrl = "https://en.wikipedia.org/api/rest_v1/page/summary/"
    
    func requestInfo(_ name: String, completion: @escaping (WikiModel) -> Void) {
        AF.request(baseUrl + name,method: .get).response { response in
            switch response.result {
            case .success:
                let jsonResponse = JSON(response.value)
                let model = WikiModel(title: jsonResponse["title"].stringValue, summary: jsonResponse["extract"].stringValue, imageUrl: jsonResponse["thumbnail"]["source"].stringValue)
                print(model)
                completion(model)
            case .failure(let error):
                print(error)
            }
        }
    }
}
