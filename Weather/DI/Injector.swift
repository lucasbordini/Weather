//
//  Injector.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import Swinject
import Combine
import SwiftUI

struct Injector {
    static var resolver: Resolver?
}


@propertyWrapper
struct InjectedStateObject<Value>: DynamicProperty where Value: ObservableObject {
    
    @StateObject private var service: Value
    
    public init() {
        self.init(name: nil, resolver: nil)
    }
    
    public init(name: String? = nil, resolver: Resolver? = nil) {
        guard let resolver = resolver ?? Injector.resolver else {
            fatalError("Make sure Injector.resolver is set!")
        }
        
        guard let value = resolver.resolve(Value.self, name: name) else {
            fatalError("Make sure you registered \(Value.self)")
        }
        
        _service = StateObject(wrappedValue: value)
    }
    
    public var wrappedValue: Value {
        get { return service }
    }
    
    public var projectedValue: ObservedObject<Value>.Wrapper {
        return self.$service
    }
}
