//
//  WeatherDetailsState.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

extension WeatherDetailsViewModel {
    
    struct UIState: Equatable {
        public let isLoading: Bool
        public let vo: WeatherDetailsVO?
        public let unit: Unit
        public let error: NetworkErrorVO
        
        init(isLoading: Bool = true,
             vo: WeatherDetailsVO? = nil,
             unit: Unit = .imperial,
             error: NetworkErrorVO = .no) {
            self.isLoading = isLoading
            self.vo = vo
            self.unit = unit
            self.error = error
        }
        
        func copy(isLoading: Bool? = nil,
            vo: WeatherDetailsVO? = nil,
                  unit: Unit? = nil,
            error: NetworkErrorVO? = nil
        ) -> Self {
            return Self(isLoading: isLoading ?? self.isLoading,
                        vo: vo ?? self.vo,
                        unit: unit ?? self.unit,
                        error: error ?? self.error)
        }
    }
}
