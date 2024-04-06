//
//  ViewModelInjection.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerViewModel() -> Self {
        self.register(WeatherDetailsViewModel.self, factory: { resolver, position in
            return WeatherDetailsViewModel(
                fetchWeatherUC: resolver.resolve(FetchWeatherUseCase.self)!,
                position: position)
        })
        self.autoregister(LocationViewModel.self, initializer: LocationViewModel.init)
        return self
    }
}
