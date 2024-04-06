//
//  AdditionalInfo.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

struct AdditionalInfo: Decodable {
    let temp: Double
    let feels: Double
    let humidity: Double
    
    enum CodingKeys: String, CodingKey  {
        case temp = "temp"
        case feels = "feels_like"
        case humidity = "humidity"
    }
}
