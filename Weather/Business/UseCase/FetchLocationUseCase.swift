//
//  FetchLocationUseCase.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import Foundation
import Combine

class FetchLocationUseCase {
    
    private let repository: LocationRepository
    
    init(repository: LocationRepository) {
        self.repository = repository
    }
    
    func execute(city: String) -> AnyPublisher<[Location], NetworkError> {
        return repository.searchLocation(for: city)
            .map { location in
                return location.uniqued()
            }.eraseToAnyPublisher()
    }
}
