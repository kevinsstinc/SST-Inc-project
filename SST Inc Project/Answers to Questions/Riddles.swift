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
    @State private var isFourthTextVisible = false
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State private var isActive3 = false
    @State private var showingAlertForCorrectAnswer = false
    @State private var showingAlertForWrongtAnswer = false
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
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                isFirstTextVisible = false
                                isSecondTextVisible = true
                            }
                        }
                }
                if isSecondTextVisible{
                    Spacer()
                    TextType(fullText: "I'll give you three clues. Figure it out.")
                        .multilineTextAlignment(.center)
                        .font(.largeTitle)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                
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
                            Text("CLUE 1")
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
                    Button{
                        isFourthTextVisible = true
                        isThirdTextVisible = false
                    }label:{
                        
                        Text("NEXT")
                            .padding()
                            .monospaced()
                            .foregroundStyle(.black)
                            .background {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundStyle(.green)
                                    .frame(width: 350, height: 40)
                            }
                        
                    }
                    
                }
                if isFourthTextVisible {
                    VStack {
                        TextType(fullText: "Choose carefully")
                            .font(.largeTitle)
                        Spacer()
                        
                        
                        HStack {
                            Button(action: {
                                showingAlertForWrongtAnswer = true
                            }) {
                                Text("The City Hall")
                                    .font(.title)
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 170, height: 170)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundStyle(.green)
                                    )
                            }
                            .padding()
                            .alert(isPresented: $showingAlertForWrongtAnswer) {
                                Alert(
                                    title: Text("ANSWER IS WRONG"),
                                    message: Text("Try again?"),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                            
                            Button(action: {
                                showingAlertForWrongtAnswer = true
                            }) {
                                Text("The Bank \n of Singapore")
                                    .font(.title)
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 170, height: 170)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundStyle(.green)
                                    )
                            }
                            .padding()
                            .alert(isPresented: $showingAlertForWrongtAnswer) {
                                Alert(
                                    title: Text("ANSWER IS WRONG"),
                                    message: Text("Try again?"),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                        }
                        
                        
                        HStack {
                            Button(action: {
                                showingAlertForWrongtAnswer = true
                            }) {
                                Text("The National Museum")
                                    .font(.title)
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 170, height: 170)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundStyle(.green)
                                    )
                            }
                            .padding()
                            .alert(isPresented: $showingAlertForWrongtAnswer) {
                                Alert(
                                    title: Text("ANSWER IS WRONG"),
                                    message: Text("Try again?"),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                            
                            Button(action: {
                                showingAlertForCorrectAnswer = true
                            }) {
                                Text("The Marina Bay Sands")
                                    .font(.title)
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 170, height: 170)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundStyle(.green)
                                    )
                            }
                            .padding()
                            .alert(isPresented: $showingAlertForCorrectAnswer) {
                                Alert(
                                    title: Text("ANSWER IS CORRECT"),
                                    message: Text("continue?"),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                        }
                        Spacer()
                    }
                }
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
