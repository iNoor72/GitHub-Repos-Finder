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
//        request.headers = HTTPHeaders(headers)
        return request
    }
}
