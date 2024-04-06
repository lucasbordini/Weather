//
//  Request.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Combine
import Foundation

struct Request {
    let url: String
    let headers: [String: String]?
    let body: Data?
    let method: HTTPMethod
    
    func buildURLRequest(converted url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
}
