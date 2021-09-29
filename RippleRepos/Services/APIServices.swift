//
//  APIServices.swift
//  Ripple-Task
//
//  Created by Noor Walid on 24/09/2021.
//

import Foundation
import Alamofire

protocol API {
    func fetch<T:Decodable> (for repoName: String, completion: @escaping (T?, Error?) -> ())
}

class APIServices: API {
    private init() {}
    static let shared = APIServices()
    
    func fetch<T:Decodable> (for repoName: String, completion: @escaping (T?, Error?) -> ()) {
        AF.request(Router.byRepoName(repoName: repoName)).responseDecodable {(response: DataResponse<T, AFError>) in
            switch response.result {
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data,nil)
            }
        }
    }
}

