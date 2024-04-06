//
//  LocationAdapter.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct LocationAdapter: View {
    
    @InjectedStateObject var viewModel: LocationViewModel
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    NavigationLink(destination: viewModel.destination, isActive: $viewModel.isDestinationPresented, label: { })
                    LocationScreen(state: viewModel.state, onSelectCity: viewModel.onSelectCity, onSearchCity: viewModel.search)
                        .frame(width: geo.size.width, height: geo.size.height)
                }
            }
        }
    }
}
