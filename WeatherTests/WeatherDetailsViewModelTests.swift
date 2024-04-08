//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Lucas Araujo on 05/04/24.
//

import XCTest
import Swinject
import SwinjectAutoregistration
import Combine
import CombineExpectations
import Mockingbird

@testable import Weather

final class WeatherTests: XCTestCase {

    var container: Container!
    var viewModel: WeatherDetailsViewModel!
    var api: WeatherDatasource!
    var recorder: Recorder<WeatherDetailsViewModel.UIState, Never>!
    var response = PassthroughSubject<WeatherDTO, NetworkError>()
    
    override func setUp() {
        super.setUp()
                
        api = mock(WeatherDatasource.self)
        
        container = MockContainer
            .resolver
            .registerWeatherViewModelTestables(api: api)
        
        viewModel = container.resolve(WeatherDetailsViewModel.self)
        
        recorder = viewModel.$state.record()
    }
    
    override func tearDown() {
        super.tearDown()
        container = nil
        viewModel = nil
        api = nil
        recorder = nil
    }
    
    func testInitialTest() {
        XCTAssertEqual(viewModel.state, .init())
        XCTAssertEqual(viewModel.selectedScale, 1)
        XCTAssertEqual(viewModel.position, mockPosition)
    }
    
    func testOnLoadVOWithSuccess() {
        response.send(.init(city: "UnitTest", timezone: -18000, weather: [], additional: AdditionalInfo(temp: 0, feels: 0, humidity: 0), wind: Wind(speed: 0)))
        response.send(completion: .finished)
        
        
        let states = try! recorder.availableElements.get()
        
        // First State - When init
        XCTAssertTrue(states[0].isLoading)
        XCTAssertNil(states[0].vo)
        XCTAssertEqual(states[0].error, .no)
        
        // Second State - When receive a value
        XCTAssertTrue(states[1].isLoading)
        XCTAssertNotNil(states[1].vo)
        XCTAssertEqual(states[1].error, .no)
        
        // Third State - When complete
        XCTAssertFalse(states[2].isLoading)
        XCTAssertNotNil(states[2].vo)
        XCTAssertEqual(states[2].error, .no)
    }
    
    func testOnLoadVOWithError() {
        response.send(completion: .failure(.unauthorized))
    
        let states = try! wait(for: recorder.elements, timeout: 5)
        
        // First State - When init
        XCTAssertTrue(states[0].isLoading)
        XCTAssertNil(states[0].vo)
        XCTAssertEqual(states[0].error, .no)
        
        // Second State - When receive an error
        XCTAssertFalse(states[1].isLoading)
        XCTAssertNil(states[1].vo)
        XCTAssertEqual(states[1].error, .error(.unauthorized))
    }

}

let mockPosition = Position(latitude: -49, longitude: 74)

fileprivate extension Container {
    func registerWeatherViewModelTestables(api: WeatherDatasource) -> Self {
        self.register(WeatherDatasource.self, factory: { resolver in
            return api
        })
        self.autoregister(WeatherDetailRepository.self, initializer: WeatherDetailRepository.init)
        self.autoregister(FetchWeatherUseCase.self, initializer: FetchWeatherUseCase.init)
        self.register(WeatherDetailsViewModel.self, factory: { resolver in
            return WeatherDetailsViewModel(fetchWeatherUC: resolver.resolve(FetchWeatherUseCase.self)!,
                                           position: mockPosition)
        })
        return self
    }
}
