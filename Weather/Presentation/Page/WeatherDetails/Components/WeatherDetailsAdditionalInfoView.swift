//
//  WeatherDetailsAdditionalInfoView.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI

struct WeatherDetailsAdditionalInfoView: View {
    
    let image: String
    let value: String
    let name: String
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.cyan.opacity(0.25))
                .frame(width: 60)
                .overlay(Image(image)
                    .resizable()
                    .padding()
                )
            Text(value)
                .font(.headline)
                .bold()
            Text(name)
                .font(.subheadline)
                .foregroundStyle(Color.gray)
        }
    }
}

#Preview {
    WeatherDetailsAdditionalInfoView(image: "Wind", value: "36", name: "Wind")
}
