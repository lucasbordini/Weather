//
//  LocationRepository.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import Foundation
import Combine

class LocationRepository {
    
    var datasource: WeatherDatasource
    
    init(datasource: WeatherDatasource) {
        self.datasource = datasource
    }
 
    func searchLocation(for city: String) -> AnyPublisher<[Location], NetworkError> {
        let url = "\(APIConstants.baseURL)/geo/1.0/direct?q=\(city)&limit=5&appid=\(APIConstants.APIKey)"
        let request = Request(url: url, headers: nil, body: nil, method: .GET)
        return datasource.request(request)
    }
    
}
