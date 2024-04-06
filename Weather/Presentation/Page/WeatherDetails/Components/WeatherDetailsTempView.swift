//
//  WeatherDetailsTempView.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI

struct WeatherDetailsTempView: View {
    
    let image: String
    let temp: String
    let description: String
    let unit: Unit
    let isLoading: Bool
    
    var body: some View {
        VStack {
            Image(image)
            Text("\(temp)º \(unit.getTemperature())")
            Text(description)
        }
    }
}

#Preview {
    WeatherDetailsTempView(image: "Clouds", temp: "29", description: "Céu nublado", unit: .imperial, isLoading: false)
}
