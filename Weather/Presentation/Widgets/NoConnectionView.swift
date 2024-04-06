//
//  NoConnectionView.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct NoConnectionView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Image("Offline")
            Text("Looks like you are offline, check you internet connection and try again")
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    NoConnectionView()
}
