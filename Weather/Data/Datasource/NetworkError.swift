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
}
