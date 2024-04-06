//
//  LocationViewModel.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import Foundation
import Combine

class LocationViewModel: ObservableObject {
    
    @Published var state = UIState()
    private var cancellable = Set<AnyCancellable>()
    let fetchLocationUC: FetchLocationUseCase
    
    @Published var destination: WeatherDetailsAdapter? = nil
    @Published var isDestinationPresented = false
    
    public init(fetchLocationUC: FetchLocationUseCase) {
        self.fetchLocationUC = fetchLocationUC
    }
    
    func search(for query: String) {
        fetchLocationUC.execute(city: query)
            .handleEvents(receiveSubscription: { [weak self] _ in
                guard let self = self else { return }
                self.state = self.state.copy(isLoading: true)
            }, receiveCancel: { [weak self] in
                guard let self = self else { return }
                self.state = self.state.copy(isLoading: false)
            }).receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                
                switch completion {
                case .finished:
                    self.state = self.state.copy(isLoading: false)
                case let .failure(error):
                    self.state = self.state.copy(isLoading: false, error: error)
                }
            } receiveValue: { [weak self] location in
                guard let self = self else { return }
                self.state = self.state.copy(isLoading: false, foundCities: location, isEmptySearch: location.isEmpty)
            }.store(in: &cancellable)

    }
    
    func onSelectCity(city: Location) {
        destination = WeatherDetailsAdapter(position: Position(latitude: city.lat, longitude: city.lon))
        isDestinationPresented = true
    }
}
