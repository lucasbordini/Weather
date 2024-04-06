//
//  LocationScreen.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct LocationScreen: View {
    
    let state: LocationViewModel.UIState
    let onSelectCity: (Location) -> Void
    let onSearchCity: (String) -> Void
    
    @State private var query = String()
    
    var body: some View {
        VStack(alignment: .center) {
            LocationSearchView(onSearchCity: onSearchCity)
            if state.isEmptySearch {
                LocationEmptyResultView()
            } else {
                List(state.foundCities, rowContent: { location in
                    LocationResultRowView(location: location, onSelectCity: onSelectCity)
                })
            }
        }.overlay(state.isLoading ? LoadingView() : nil)
    }
}

#Preview {
    LocationScreen(state: .init(
        isEmptySearch: true,
        foundCities: [
            //            Location(name: "Campinas", lat: 0, lon: 0, country: "BR", state: "São Paulo"),
            //            Location(name: "Campinas", lat: 0, lon: 0, country: "BR", state: "Santa Catarina"),
            //            Location(name: "Campinas", lat: 0, lon: 0, country: "BR", state: "Rio Grande do Sul")
        ]
    ), onSelectCity: { _ in }, onSearchCity: { _ in })
}
