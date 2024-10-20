//
//  MoneyRemaining.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 19/10/24.
//

import SwiftUI

struct MoneyRemaining: View {
    @State private var firstViewVisible: Bool = true
    @State private var secondViewVisble: Bool = false
    @State private var thirdViewVisble: Bool = false
    @State private var text = ""
    @State private var showingAlert: Bool = false
    @State private var correctAnswer = false
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            if correctAnswer{
                EscapeRoute()
            }else{
                VStack{
                    ProgressBar(progress: 0.6)
                    if firstViewVisible{
                        TextType(fullText:"Money Remaining")
                            .padding()
                            .foregroundStyle(.green)
                            .font(.system(size: 60))
                            .multilineTextAlignment(.center)
                            .monospaced()
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                                    firstViewVisible = false
                                    secondViewVisble = true
                                }
                            }
                        
                        TextType(fullText: "$98 375")
                            .font(.system(size: 65))
                            .bold()
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                                    firstViewVisible = false
                                    secondViewVisble = true
                                }
                            }
                    }
                    if secondViewVisble{
                        TextType(fullText: "Money before the heist")
                            .padding()
                            .foregroundStyle(.green)
                            .font(.system(size: 60))
                            .multilineTextAlignment(.center)
                            .monospaced()
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 20.0){
                                    secondViewVisble = false
                                    thirdViewVisble = true
                                }
                            }
                        TextType(fullText: "(50000 * 4) + (25 * 1000) + (12^3 - 144) + (sqrt(19600) * 10) - (2 * 2000)")
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 20.0){
                                    secondViewVisble = false
                                    thirdViewVisble = true
                                }
                            }
                    }
                    if thirdViewVisble{
                        VStack{
                            TextType(fullText: "How much money was stolen?")
                                .font(.system(size: 60))
                                .multilineTextAlignment(.center)
                            TextField("Enter your answer", text: $text)
                                .padding()
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundStyle(.green)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.green, lineWidth: 2)
                                }
                            Button{
                                checkAnswer()
                            }label:{
                                Text("SUBMIT")
                                    .padding()
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .background{
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(.green)
                                            .frame(width: 350, height: 40)
                                    }
                            }
                            .alert(isPresented: $showingAlert){
                                Alert(
                                    title: Text("ANSWER IS CORRECT"),
                                    message: Text("continue?"),
                                    dismissButton: .default(Text("OK")) {
                                        correctAnswer = true  // Move to the next view
                                    }
                                )
                            }
                        }
                        .padding()
                        
                    }
                    
                    
                    
                    
                }
            }
            
        }
    }
        func checkAnswer(){
            if text.lowercased() == "102000"{
                showingAlert = true
            }
            
        }
    }

#Preview {
    MoneyRemaining()
}
