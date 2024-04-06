//
//  ContentView.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @InjectedStateObject var connection: ConnectionObserver
    
    var body: some View {
        GeometryReader { geo in
            if connection.isConnected {
                LocationAdapter()
            } else {
                NoConnectionView()
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

#Preview {
    ContentView()
}
