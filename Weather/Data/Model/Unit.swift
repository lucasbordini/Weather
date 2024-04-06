//
//  Unit.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Foundation

enum Unit: Int {
    case imperial
    case metric
    
    func getSpeed() -> String {
        switch self {
        case .imperial:
            return "mph"
        case .metric:
            return "m/s"
        }
    }
    
    func getTemperature() -> String {
        switch self {
        case .imperial:
            return "F"
        case .metric:
            return "C"
        }
    }
}
