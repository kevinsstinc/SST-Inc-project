//
//  Riddles.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 19/10/24.
//

import SwiftUI

struct Riddles: View {
    @State private var isFirstTextVisible = true
    @State private var isSecondTextVisible = false
    @State private var isThirdTextVisible = false
    @State private var isFourthTextVisble = false
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State private var isActive3 = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ProgressBar(progress: 0.2)
                    .padding()
                if isFirstTextVisible {
                    TextType(fullText: "Where did the heist occur?")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                                isFirstTextVisible = false
                                isSecondTextVisible = true
                            }
                        }
                }
                if isSecondTextVisible{
                    Spacer()
                    TextType(fullText: "I'll give you three riddles. Figure it out.")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                                
                                isSecondTextVisible = false
                                isThirdTextVisible = true
                            }
                        }
                }
                Spacer()
                if isThirdTextVisible{
                    VStack{
                        Button{
                            isActive1 = true
                        }label:{
                            Text("CLUE one")
                                .padding()
                                .monospaced()
                                .foregroundStyle(.black)
                                .font(.title)
                                .background{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.green)
                                }
                        }
                        .sheet(isPresented: $isActive1) {
                            Clue1()
                        }
                        Spacer()
                        Button{
                            isActive2 = true
                        }label:{
                            Text("CLUE 2")
                                .padding()
                                .monospaced()
                                .foregroundStyle(.black)
                                .font(.title)
                                .background{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.green)
                                }
                        }
                        .sheet(isPresented: $isActive2) {
                            Clue2()
                        }
                        Spacer()
                        Button{
                            isActive3 = true
                        }label:{
                            Text("CLUE 3")
                                .padding()
                                .monospaced()
                                .foregroundStyle(.black)
                                .font(.title)
                                .background{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.green)
                                }
                        }
                        .sheet(isPresented: $isActive3) {
                            Clue3()
                        }
                        Spacer()
                    }
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                isThirdTextVisible = false
                isFourthTextVisble = true
            }
        }
        
    }
        
}

struct Clue1:View{
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ScrollView{
                    Text("This location offers a wealth of entertainment and luxury, where financial success meets a breathtaking skyline view that reflects the prosperity of a nation.")
                        .padding()
                        .foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        
                }
            }
        }
    }
}
struct Clue2:View{
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ScrollView{
                    Text("A towering achievement in architecture, this site embodies a fusion of modernity and tradition, standing tall among the city's financial districts, echoing the pulse of urban life.")
                        .padding()
                        .foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        
                }
            }
        }
    }
}
struct Clue3:View{
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ScrollView{
                    Text("More than just a place for leisure, this landmark showcases the vibrant culture of Singapore, with exhibitions that mirror the richness of history and the forward-thinking spirit of a city.")
                        .padding()
                        .foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        
                }
            }
        }
    }
}
#Preview {
    Riddles()
}
