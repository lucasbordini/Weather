//
//  LocationState.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import Foundation

extension LocationViewModel {
    
    struct UIState: Equatable {
        let isLoading: Bool
        let foundCities: [Location]
        let isEmptySearch: Bool
        let error: NetworkErrorVO
        
        init(isLoading: Bool = false,
             isEmptySearch: Bool = false,
             foundCities: [Location] = [],
             error: NetworkErrorVO = .no) {
            self.isLoading = isLoading
            self.foundCities = foundCities
            self.error = error
            self.isEmptySearch = isEmptySearch
        }
        
        func copy(isLoading: Bool? = nil,
                  foundCities: [Location]? = nil,
                  isEmptySearch: Bool? = nil,
                  error: NetworkErrorVO? = nil
        ) -> Self {
            return Self(isLoading: isLoading ?? self.isLoading,
                        isEmptySearch: isEmptySearch ?? self.isEmptySearch,
                        foundCities: foundCities ?? self.foundCities,
                        error: error ?? self.error)
        }
    }
}
