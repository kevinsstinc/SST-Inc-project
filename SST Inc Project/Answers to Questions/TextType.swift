//
//  TextType.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 19/10/24.
//

import SwiftUI

struct TextType: View {
    @State private var typedText: String = "qweerrt"
    let fullText: String
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Text(typedText)
                    .monospaced()
                    .foregroundStyle(.green)
                    .padding()
                    .onAppear{
                        startTyping()
                    }
            }
            
        }
    }
    func startTyping(){
        typedText = ""
        let characters = Array(fullText)
        for i in characters.indices{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1){
                typedText.append(characters[i])
                
            }
        }
    }
}

#Preview {
    TextType(fullText: "erm sigma if it works")
}
