//
//  APIResponse.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
}
