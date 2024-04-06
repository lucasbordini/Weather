//
//  UseCaseInjection.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerUseCases() -> Self {
        self.autoregister(FetchWeatherUseCase.self, initializer: FetchWeatherUseCase.init)
        self.autoregister(FetchLocationUseCase.self, initializer: FetchLocationUseCase.init)
        return self
    }
}
