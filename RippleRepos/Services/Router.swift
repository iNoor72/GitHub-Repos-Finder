//
//  Router.swift
//  Ripple-Task
//
//  Created by Noor Walid on 24/09/2021.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static let url = "https://api.github.com/search"
    
    case byRepoName(repoName:String)
    
    var method: HTTPMethod {
        switch self {
        case .byRepoName:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .byRepoName:
            return "/repositories"
        }
    }
    
    //The headers here are for the Github authentication using OAuth2.0, I created an app on Github
        //with clientID and client secret codes, and it's embedded here in the headers of the call.
    var headers: [String:String] {
        switch self {
        case .byRepoName:
            return ["client_id":"775369ca2e8f906a28b4", "client_secret":"d3c42f876fec8d23eb7cb72acb910841dc43fba6"]
        }
    }
    
    var parameters: [String:Any]? {
        switch self {
        case .byRepoName(let repoName):
            return ["q":"\(repoName)", "per_page":50]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.url)
        guard let safeURL = url else { return URLRequest(url: URL(string: "https://www.google.com")!) }
        var request = URLRequest(url: safeURL.appendingPathComponent(path))
        request.method = method
        switch self {
        case .byRepoName(_):
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        request.headers = HTTPHeaders(headers)
        return request
    }
}
