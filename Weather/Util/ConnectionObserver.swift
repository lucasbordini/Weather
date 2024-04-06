//
//  ConnectionObserver.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import Foundation
import SwiftUI
import Combine
import Reachability

class ConnectionObserver: ObservableObject {
  
  private let reachability = try? Reachability()
  
  @Published var isConnected = true
  
  init() {
    if let reachability = reachability {
      reachability.whenReachable = { _ in
        DispatchQueue.main.async {
          self.isConnected = true
        }
      }
      reachability.whenUnreachable = { _ in
        DispatchQueue.main.async {
          self.isConnected = false
        }
      }
      
      do {
        try reachability.startNotifier()
      } catch {
        print("Unable to start reachability notifier")
      }
    }
  }
  
}
