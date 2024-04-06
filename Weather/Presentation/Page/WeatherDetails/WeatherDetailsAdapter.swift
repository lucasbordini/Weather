//
//  WeatherDetailsAdapter.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI
import Swinject

struct WeatherDetailsAdapter: View {
    
    @StateObject var viewModel: WeatherDetailsViewModel
    @Environment(\.refresh) private var refresh
    
    init(
        position: Position,
        resolver: Resolver = Injector.resolver!
    ) {
        self._viewModel = StateObject(wrappedValue: resolver.resolve(WeatherDetailsViewModel.self,
                                                                    argument: position)!)
    }
    
    var body: some View {
        GeometryReader { geo in
            List {
                WeatherDetailsScreen(state: viewModel.state,
                                     onChangeCity: viewModel.onChangeCity,
                                     scaleSelected: $viewModel.selectedScale
                ).frame(width: geo.size.width, height: geo.size.height)
            }
            .listStyle(.plain)
            .refreshable {
                viewModel.loadVO(for: viewModel.state.unit)
            }
        }
    }
}
