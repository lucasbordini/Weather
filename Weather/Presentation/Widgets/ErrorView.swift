//
//  ErrorView.swift
//  Weather
//
//  Created by Lucas Araujo on 06/04/24.
//

import SwiftUI

struct ErrorView: View {
    
    let failure: NetworkError?
    
    @State private var show = true
    
    var body: some View {
        VStack {
            if show {
                HStack(alignment: .top, spacing: 0) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.white)
                        .padding([.leading, .top])
                        
                    VStack(alignment: .leading) {
                        Text(failure?.localizedDescription ?? "")
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .padding([.trailing, .top])
                            .padding(.leading, 8)
                        Button(action: { withAnimation {
                            show.toggle()
                        }}) {
                            Text("OK!")
                                .foregroundStyle(Color.white)
                                .font(.subheadline)
                                .padding([.trailing, .bottom])
                                .padding(.top, 6)
                                .padding(.leading, 8)
                        }
                    }.frame(maxWidth: .infinity)
                } .transition(.asymmetric(insertion: AnyTransition.move(edge: .top),
                                          removal: AnyTransition.move(edge: .top)))
                .background(Color.red.opacity(0.75))
            }
        }.contentShape(Rectangle())
            .onAppear { withAnimation {
                show = true
            }}
    }
}

#Preview {
    ErrorView(failure: .unauthorized)
}
