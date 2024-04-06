//
//  WeatherApp.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI
import Swinject

@main
struct WeatherApp: App {
    
    init() {
        Injector.resolver = Container()
            .registerServices()
            .registerRepositories()
            .registerUseCases()
            .registerViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    enum Destination {
        case Details(city: String)
        case Search
    }
}
