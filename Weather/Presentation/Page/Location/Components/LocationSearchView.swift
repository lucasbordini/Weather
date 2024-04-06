//
//  LocationSearchView.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct LocationSearchView: View {
    
    let onSearchCity: (String) -> Void
    
    @State private var query = String()
    
    var body: some View {
        HStack {
            TextField("Search for a city", text: $query) { _ in
                
            } onCommit: {
                onSearchCity(query)
            }
            .textFieldStyle(CustomTextFieldStyle())
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
                .onTapGesture { onSearchCity(query) }
        }.padding()
    }
}

#Preview {
    LocationSearchView(onSearchCity: { _ in })
}
