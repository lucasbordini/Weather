//
//  WeatherDetailsViewModel.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation
import Combine

class WeatherDetailsViewModel: ObservableObject {
    // 0 = celcius; 1 = fahrenheit
    @Published var selectedScale = 1
    
    @Published var state = UIState()
    
    private var cancellable = Set<AnyCancellable>()
    let fetchWeatherUC: FetchWeatherUseCase
    let position: Position
    
    public init(fetchWeatherUC: FetchWeatherUseCase, position: Position) {
        self.fetchWeatherUC = fetchWeatherUC
        self.position = position
        
        $selectedScale
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .removeDuplicates()
            .sink { [weak self] scale in
                guard let self = self else { return }
                let unit: Unit = scale == 0 ? .metric : .imperial
                self.loadVO(for: unit)
            }.store(in: &cancellable)
        
        loadVO(for: .imperial)
    }
    
    
    func loadVO(for unit: Unit) {
        fetchWeatherUC.execute(position: position, unit: unit)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveSubscription: { [weak self] _ in
                guard let self = self else { return }
                self.state = self.state.copy(isLoading: true, error: .no)
            }, receiveCancel: { [weak self] in
                guard let self = self else { return }
                self.state = self.state.copy(isLoading: true)
            }).sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case let .failure(error):
                    self.state = self.state.copy(isLoading: false, error: .error(error))
                case .finished:
                    self.state = self.state.copy(isLoading: false)
                }
            }, receiveValue: { [weak self] vo in
                guard let self = self else { return }
                self.state = self.state.copy(vo: vo, unit: unit)
            }).store(in: &cancellable)
    }
}


