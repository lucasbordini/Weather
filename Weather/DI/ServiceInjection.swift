//
//  ServiceInjection.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerServices() -> Self {
        self.autoregister(WeatherDatasource.self, initializer: APIDatasource.init)
        self.autoregister(ConnectionObserver.self, initializer: ConnectionObserver.init)
        return self
    }
}
