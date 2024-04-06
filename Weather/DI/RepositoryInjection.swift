//
//  RepositoryInjection.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerRepositories() -> Self {
        self.autoregister(WeatherDetailRepository.self, initializer: WeatherDetailRepository.init)
        self.autoregister(LocationRepository.self, initializer: LocationRepository.init)
        return self
    }
}
