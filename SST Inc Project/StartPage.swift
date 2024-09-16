//
//  StartPage.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 16/9/24.
//

import SwiftUI

struct StartPage: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            GeometryReader { proxy in
                let size = proxy.size
                
                HStack {
                    ForEach(1...Int(size.width / 25), id: \.self) { _ in
                        RainCharacters(size: size)
                    }
                }
                .padding(.horizontal) // Apply padding to HStack
            }
        }
    }

    struct RainCharacters: View {
        let size: CGSize
        @State var startAnimation: Bool = false
        @State var random: Int = 0
        
        var body: some View {
           
                let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
                
                VStack {
                    ForEach(0..<constant.count, id: \.self) { index in
                        let character = Array(constant)[getRandomIndex(index: index)]
                        Text(String(character))
                            .font(.system(size: 25, weight: .light, design: .monospaced))
                            .foregroundStyle(.green)
                    }
                }
                .mask(alignment: .top) {
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [
                                .clear,
                                .black.opacity(0.1),
                                .black.opacity(0.2),
                                .black.opacity(0.3),
                                .black.opacity(0.5),
                                .black.opacity(0.7),
                                .black
                            ], startPoint: .top, endPoint: .bottom)
                        )
                        .frame(height: size.height) // Use full height for smoother animation
                        .offset(y: startAnimation ? size.height : -randomHeight)
                }
                .onAppear {
                    withAnimation(.linear(duration: 2).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                        startAnimation = true
                    }
                }
                .onReceive(Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()) { _ in
                    random = Int.random(in: 0..<constant.count)
                }
            }
            
            func getRandomIndex(index: Int) -> Int {
                let max = constant.count - 1
                let newIndex = index + random
                if newIndex > max {
                    return max - (newIndex - max) // Ensure within bounds
                }
                return newIndex
            }
        }
        
    }


#Preview {
    StartPage()
}

let constant = "0101010101010101010101010101010101010010101010101010101010101010101010"
