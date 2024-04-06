//
//  WheaterDetailsScaleSelectorView.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI

struct WeatherDetailsScaleView: View {
    
    @Binding var selectedScale: Int
    
    var body: some View {
        Picker("", selection: $selectedScale, content: {
            Text("Celcius")
                .tag(0)
            Text("Farenheit")
                .tag(1)
        }).pickerStyle(SegmentedPickerStyle())
            .padding()
            .onAppear {
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
                UISegmentedControl.appearance().backgroundColor = UIColor.lightGray
            }
    }
}

#Preview {
    WeatherDetailsScaleView(selectedScale: .constant(0))
}
