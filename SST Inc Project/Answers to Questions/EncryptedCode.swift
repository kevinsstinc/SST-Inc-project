//
//  EncryptedCode.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 19/10/24.
//

import SwiftUI

struct EncryptedCode: View {
    @State private var inputText = ""
    @State private var showingAlert = false
    @State private var fakeAlert = false
    @State private var answerCorrect = false  // Track if the answer is correct
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if answerCorrect {
                // Show the next view if the answer is correct
                Riddles()  // Replace with the actual next view
            } else {
                // Main EncryptedCode content
                VStack {
                    ProgressBar(progress: 0.2)
                    TextType(fullText: "Who is Tall Avyan's Accomplice")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    TextType(fullText: "ENCRYPTED CODE \n c2FuYXRoIHdhcmFk")
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
                        Button {
                            checkAnswer()
                        } label: {
                            Text("SUBMIT")
                                .padding()
                                .monospaced()
                                .foregroundStyle(.black)
                                .background {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundStyle(.green)
                                        .frame(width: 350, height: 40)
                                }
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("ANSWER IS CORRECT"),
                                message: Text("continue?"),
                                dismissButton: .default(Text("OK")) {
                                    answerCorrect = true  // Move to the next view
                                }
                            )
                        }
                    }
                }
            }
        }
    }
    
    func checkAnswer() {
        if inputText.lowercased() == "sanath warad" {
            showingAlert = true
        }
    }
}
#Preview {
    EncryptedCode()
}
