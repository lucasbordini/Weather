//
//  LocationResultRowView.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct LocationResultRowView: View {
    
    let location: Location
    let onSelectCity: (Location) -> Void
    
    var body: some View {
        Text("\(location.name), \(location.state) - \(location.country)")
            .onTapGesture { onSelectCity(location) }
            .padding()    }
}

#Preview {
    LocationResultRowView(location: Location.init(name: "Campinas", lat: -40, lon: -90, country: "BR", state: "São Paulo"),
    onSelectCity: { _ in })
}
