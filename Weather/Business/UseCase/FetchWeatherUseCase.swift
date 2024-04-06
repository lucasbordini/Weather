//
//  FetchWeatherUseCase.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation
import Combine

class FetchWeatherUseCase {
    private let repository: WeatherDetailRepository
    
    init(repository: WeatherDetailRepository) {
        self.repository = repository
    }
    
    func execute(position: Position, unit: Unit) -> AnyPublisher<WeatherDetailsVO, NetworkError> {
        return repository.fetchWeather(for: position, using: unit)
            .map { WeatherDetailsVO.fromDTO($0, isDay: Self.getIsDay(timezone: $0.timezone))}
            .eraseToAnyPublisher()
    }
    
    private static func getIsDay(timezone: Int) -> Bool {
        let timezone = TimeZone(secondsFromGMT: timezone)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timezone
        dateFormatter.dateFormat = "H"
        
        let stringHour = dateFormatter.string(from: Date())
        let intHour = Int(stringHour) ?? 0
        return intHour <= 18
    }
    
}
