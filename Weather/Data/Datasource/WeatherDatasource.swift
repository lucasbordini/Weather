//
//  Datasource.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation
import Combine

/// @mockable
protocol WeatherDatasource {
    func request<T: Decodable>(_ req: Request) -> AnyPublisher<T, NetworkError>
}

class APIDatasource: WeatherDatasource {
   
    lazy var session: URLSession = {
        let configutation = URLSessionConfiguration.default
        configutation.timeoutIntervalForRequest = 30
        let session = URLSession(configuration: configutation)
        return session
    }()
    
    func request<T>(_ req: Request) -> AnyPublisher<T, NetworkError> where T : Decodable {
        guard let url = URL(string: req.url) else {
            return Fail<T, NetworkError>(error: .badURL("Invalid URL")).eraseToAnyPublisher()
        }
        
        return session
            .dataTaskPublisher(for: req.buildURLRequest(converted: url))
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.serverError(code: (response as? HTTPURLResponse)?.statusCode ?? -1, error: "Failed to fetch data")
                }
                return data
            }.decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> NetworkError in
                if error is DecodingError {
                    return NetworkError.malformedJSON(error.localizedDescription)
                } else if let network = error as? NetworkError {
                    return network
                } else {
                    return NetworkError.unexpected(error.localizedDescription)
                }
            }.eraseToAnyPublisher()
    }
}
