//
//  Weather.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

struct Weather: Decodable {
    let id: Int
    let name: String
    let description: String
    
    enum CodingKeys: String, CodingKey  {
        case id = "id"
        case name = "main"
        case description = "description"
    }
    
    // Return the image name associated with the weather
    func getCorrespondingImage(isDay: Bool) -> String {
        let time = isDay ? "D" : "N"
        switch id {
        case 200...232:
            return "Thurderstom"
        case 300...321:
            return "Drizzle"
        case 500:
            return "LightRain"
        case 501:
            return "ModerateRain"
        case 502, 503, 504, 520, 521, 522, 531:
            return "HeavyRain"
        case 511, 611:
            return "Sleet"
        case 600:
            return "LightSnow"
        case 601, 602, 612...622:
            return "Snow"
        case 700...781:
            return "Fog\(time)"
        case 800:
            return "Clear\(time)"
        case 801...804:
            return "Clouds"
        default:
            return "ErrorWeather"
        }
    }
}
