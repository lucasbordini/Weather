//
//  WeatherDetailRepository.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Combine
import Foundation

class WeatherDetailRepository {
    
    var datasource: WeatherDatasource
    
    init(datasource: WeatherDatasource) {
        self.datasource = datasource
    }
    
    func fetchWeather(for pos: Position, using unit: Unit) -> AnyPublisher<WeatherDTO, NetworkError>{
        let url = "\(APIConstants.baseURL)/data/2.5/weather?lat=\(pos.latitude)&lon=\(pos.longitude)&units=\(unit)&appid=\(APIConstants.APIKey)"
        let request = Request(url: url, headers: nil, body: nil, method: .GET)
        return datasource.request(request).delay(for: 3, scheduler: DispatchQueue.global()).eraseToAnyPublisher()
    }
    
    
}
