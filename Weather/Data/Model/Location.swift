//
//  Location.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import Foundation

struct Location: Decodable, Equatable, Hashable, Identifiable {
    
    var id: String {
        return name + state + country
    }
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name && lhs.country == rhs.country && lhs.state == rhs.state
    }
    
}

extension Sequence where Element == Location {
    func uniqued() -> [Element] {
        var unique = [Location]()
        for loc in self {
            if !(unique.map(\.id).contains(loc.id)) {
                unique.append(loc)
            }
        }
        return unique
    }
}
