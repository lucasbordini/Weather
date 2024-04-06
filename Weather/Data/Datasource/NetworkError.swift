//
//  NetworkError.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

enum NetworkError: Error, Equatable {
    case unauthorized
    case badURL(_ error: String)
    case badRequest(_ error: String)
    case unexpected(_ error: String)
    case malformedJSON(_ error: String)
    case serverError(code: Int, error: String)
    
    var localizedDescription: String {
        switch self {
        case .unauthorized:
            return "Unauthorized or your API limit has exceed"
        case let .badURL(error):
            return error
        case let .badRequest(error):
            return error
        case let .unexpected(error):
            return error
        case let .malformedJSON(error):
            return error
        case let .serverError(code, error):
            return "\(error) - Status code: \(code)"
        }
    }
}
