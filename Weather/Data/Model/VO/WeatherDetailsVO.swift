//
//  WeatherDetailsVO.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

struct WeatherDetailsVO: Equatable {
    let city: String
    var temp: Double
    var feels: Double
    let humidity: Double
    let weather: String
    let weatherDescription: String
    let windSpeed: Double
    let image: String
    
    static func fromDTO(_ dto: WeatherDTO, isDay: Bool) -> Self {
        return WeatherDetailsVO(
            city: dto.city,
            temp: dto.additional.temp, 
            feels: dto.additional.feels,
            humidity: dto.additional.humidity,
            weather: dto.weather.first?.name ?? "",
            weatherDescription: dto.weather.first?.description ?? "",
            windSpeed: dto.wind.speed,
            image: dto.weather.first?.getCorrespondingImage(isDay: isDay) ?? "ErrorWeather"
        )
    }
    
}
