//
//  WeatherDetailsHeaderView.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI

struct WeatherDetailsHeaderView: View {
    
    let city: String
    let weather: String
    
    let onChangeCity: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(city)
                    .font(.title)
                Text(weather)
                    .font(.callout)
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    WeatherDetailsHeaderView(city: "São Paulo", weather: "Cloud", onChangeCity: {})
}
