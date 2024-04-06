//
//  WeatherDTO.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

struct WeatherDTO: Decodable {
    let city: String
    let timezone: Int
    let weather: [Weather]
    let additional: AdditionalInfo
    let wind: Wind
    
    enum CodingKeys: String, CodingKey  {
        case city = "name"
        case weather = "weather"
        case additional = "main"
        case wind = "wind"
        case timezone = "timezone"
    }
}
