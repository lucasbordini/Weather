//
//  NetworkErrorVO.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import Foundation

enum NetworkErrorVO: Equatable {
    case error(_ error: NetworkError)
    case no
}
