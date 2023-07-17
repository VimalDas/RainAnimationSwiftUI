//
//  ContentView.swift
//  RainAnimationSwiftUI
//
//  Created by Vimal Das on 17/07/23.
//

import SwiftUI

struct RainAnimationSwiftUI: View {
    var rows = 10
    var textContent = Array("abcdefghijklmnopqrstuvwxyz").map({ String($0) }).shuffled()
    var randomAnimDuration = 3.0...3.5
    @State var animateRain: Bool = false
        
    var body: some View {
        GeometryReader { geometry in
            HStack() {
                Spacer()
                ForEach(0..<rows) { index in
                    VStack {
                        Spacer()
                        ForEach(0..<textContent.count, id: \.self) { index in
                            Text(textContent[index])
                                .foregroundColor(Color.green)
                            Spacer()
                        }
                    }
                    .offset(y: -geometry.size.height)
                    .offset(x: 0, y: animateRain ? 2*geometry.size.height : -geometry.size.height)
                    .rotation3DEffect(animateRain ? .degrees(89) : .degrees(1), axis: (x: 0, y: 1, z: 0))
                    .animation(Animation.easeIn(duration: Double.random(in: randomAnimDuration)).repeatForever(autoreverses: false), value: animateRain)
                    Spacer()
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .clipped()
            .background(Color.black)
            .onAppear() {
                animateRain.toggle()
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
        RainAnimationSwiftUI()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
