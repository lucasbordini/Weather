//
//  WeatherScreen.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI
struct WeatherDetailsScreen: View {
    
    let state: WeatherDetailsViewModel.UIState
    let onChangeCity: () -> Void
    @Binding var scaleSelected: Int
    
    var body: some View {
        VStack(alignment: .center) {
            if case let .error(failure) = state.error {
                ErrorView(failure: failure)
            }
            let vo = state.vo
            WeatherDetailsHeaderView(city: vo?.city ?? "",
                                     weather: vo?.weather ?? "",
                                     onChangeCity: onChangeCity)
            
            WeatherDetailsTempView(image: vo?.image ?? "",
                                   temp: vo?.temp.toString() ?? "",
                                   description: vo?.weatherDescription  ?? "",
                                   unit: state.unit,
                                   isLoading: state.isLoading)
            HStack(spacing: 24) {
                WeatherDetailsAdditionalInfoView(image: "Thermometer",
                                                 value: "\(vo?.feels.toString() ?? "")º \(state.unit.getTemperature())",
                                                 name: "Feels like")
                WeatherDetailsAdditionalInfoView(image: "Wind",
                                                 value: "\(vo?.windSpeed.toString()  ?? "") \(state.unit.getSpeed())",
                                                 name: "Wind Speed")
                .padding(.top, 48)
                WeatherDetailsAdditionalInfoView(image: "Humidity",
                                                 value: "\(vo?.humidity.toString()  ?? "")%",
                                                 name: "Humidity")
            }
            Spacer()
            WeatherDetailsScaleView(selectedScale: $scaleSelected)
        }.overlay(state.isLoading ? LoadingView() : nil)
        
    }
    
}

#Preview {
    WeatherDetailsScreen(state: .init(isLoading: false, vo: WeatherDetailsVO.init(city: "São Paulo", temp: 38, feels: 36, humidity: 85, weather: "Cloud", weatherDescription: "It's a cloud day outside", windSpeed: 4.79, image: "Clouds")), onChangeCity: {}, scaleSelected: .constant(0))
}
