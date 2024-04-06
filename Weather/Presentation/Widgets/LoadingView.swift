//
//  LoadingView.swift
//  Weather
//
//  Created by Lucas Araujo on 05/04/24.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var angle = Angle(degrees: 0)
    
    var body: some View {
        VStack {
            LinearGradient(colors: [.clear, Color.cyan], startPoint: .leading, endPoint: .trailing)
                .mask(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 6))
                )
                .rotationEffect(angle)
                .background(Color.clear)
                .frame(width: 96, height: 96)
                .onAppear(perform: start)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .edgesIgnoringSafeArea(.all)
                .allowsHitTesting(false)
        }.background(Color.black.opacity(0.5))
    }
    
    private func start() {
      let timer = Timer(timeInterval: TimeInterval(exactly: 0.01) ?? 0.01, repeats: true) { [self] _ in
        withAnimation() {
          angle += Angle(degrees: 4.58)
        }
      }
      RunLoop.current.add(timer, forMode: .common)
    }
}

#Preview {
    LoadingView()
}
