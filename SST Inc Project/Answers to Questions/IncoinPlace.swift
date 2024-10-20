//
//  IncoinPlace.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 20/10/24.
//

import SwiftUI

struct IncoinPlace: View {
    @State private var firstViewVisible = true
    @State private var secondViewVisible = false
    @State private var inputText = ""
    @State private var showingAlert = false
    @State private var hint = false
    @State private var answerCorrect = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if answerCorrect {
                EndingPage()  // Show EndingPage if the answer is correct
            } else {
                VStack(alignment: .leading, spacing: 15) {
                    if firstViewVisible {
                        ScrollView {
                            ProgressBar(progress: 0.9)
                            TextType(fullText: "🚨 STOLEN 🚨 INCOIN FOUND")
                                .font(.system(size: 34, weight: .bold))
                                .foregroundColor(Color.green)
                                .multilineTextAlignment(.center)
                                .padding(.top)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                        firstViewVisible = false
                                        secondViewVisible = true
                                    }
                                }
                            
                            Divider()
                                .background(Color.gray)
                            TextType(fullText: "DATA")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color.green)
                            
                            TextType(fullText: "FILE WITH INCOIN HAS BEEN FOUND")
                                .font(.system(size: 18))
                                .multilineTextAlignment(.center)
                            
                            Divider()
                                .background(Color.gray)
                            TextType(fullText: "CONS")
                                .font(.system(size: 24, weight: .semibold))
                                .foregroundColor(Color.green)
                            
                            TextType(fullText: "FILE WITH INCOIN IS ENCRYPTED")
                                .font(.system(size: 18))
                                .multilineTextAlignment(.center)
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.8))
                                .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 0)
                        )
                    }
                    
                    if secondViewVisible {
                        ZStack {
                            Color.black.ignoresSafeArea()
                            VStack {
                                ProgressBar(progress: 0.4)
                                TextType(fullText: "ENCRYPTED CODE \n KZF Hgg BM")
                                    .multilineTextAlignment(.center)
                                    .font(.largeTitle)
                                
                                Spacer()
                                VStack {
                                    Text("DECRYPTED CODE")
                                        .foregroundStyle(.green)
                                        .font(.title)
                                        .monospaced()
                                    
                                    TextField("ENTER DECRYPTED CODE", text: $inputText)
                                        .padding()
                                        .background(Color.black.opacity(0.1))
                                        .cornerRadius(10)
                                        .foregroundStyle(.green)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.green, lineWidth: 2)
                                        }
                                        .padding()
                                    
                                    HStack {
                                        Spacer()
                                        Button {
                                            checkAnswer()  // Check answer when button is pressed
                                        } label: {
                                            Text("SUBMIT")
                                                .padding()
                                                .monospaced()
                                                .foregroundStyle(.black)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 30)
                                                        .foregroundStyle(.green)
                                                        .frame(width: 150, height: 40)
                                                }
                                        }
                                        .alert(isPresented: $showingAlert) {
                                            Alert(title: Text("ANSWER IS CORRECT"),
                                                  message: Text("Continue?"),
                                                  dismissButton: .default(Text("OK")) {
                                                    answerCorrect = true  // Navigate to EndingPage
                                                  })
                                        }
                                        Spacer()
                                        
                                        Button {
                                            hint = true
                                        } label: {
                                            Text("HINT")
                                                .padding()
                                                .monospaced()
                                                .foregroundStyle(.black)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 30)
                                                        .foregroundStyle(.green)
                                                        .frame(width: 150, height: 40)
                                                }
                                        }
                                        .alert(isPresented: $hint) {
                                            Alert(title: Text("HINT"),
                                                  message: Text("I heard this encrypter sounds like vinegar"),
                                                  dismissButton: .default(Text("OK")))
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func checkAnswer() {
        if inputText.lowercased() == "sst inc" {
            showingAlert = true  // Show alert if the answer is correct
        }
    }
}

#Preview {
    IncoinPlace()
}
