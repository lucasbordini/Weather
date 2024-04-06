//
//  LocationEmptyResultView.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct LocationEmptyResultView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("SadSun")
            Text("We could not find any city with this name")
            Spacer()
        }
    }
}

#Preview {
    LocationEmptyResultView()
}
