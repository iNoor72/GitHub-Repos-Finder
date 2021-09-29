//
//  MockAPIService.swift
//  Ripple
//
//  Created by Noor Walid on 29/09/2021.
//

import Foundation

class MockAPIServices: API {
    private init() {}
    static let shared = MockAPIServices()
    
    func fetch<T:Decodable>(for repoName: String, completion: @escaping (T?, Error?) -> ()) {
        switch repoName.lowercased(){
        case "inoor72":
            if let fileURL = Bundle.main.url(forResource: Constants.testJSONFileName, withExtension: "json"){
                do {
                    let data = try Data(contentsOf: fileURL)
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(jsonData,nil)
                } catch {
                    completion(nil,error)
                }
            }
            
        default:
            if let fileURL = Bundle.main.url(forResource: Constants.jsonFileName, withExtension: "json"){
                do {
                    let data = try Data(contentsOf: fileURL)
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(jsonData,nil)
                } catch {
                    completion(nil,error)
                }
            }
        }
    }
}
