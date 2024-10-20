//
//  EscapeRoute.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 20/10/24.
//

import SwiftUI

struct EscapeRoute: View {
    @State private var isFirstTextVisible = true
    @State private var isSecondTextVisible = false
    @State private var isThirdTextVisible = false
    @State private var isActive1 = false
    @State private var isActive2 = false
    @State private var isActive3 = false
    @State private var clue1Clicked = false
    @State private var clue2Clicked = false
    @State private var clue3Clicked = false
    @State private var showTextBox = false
    @State private var answerText = ""
    @State private var showAlert = false
    @State private var isCorrectAnswer = false
    @State private var isAnswerCorrect = false  // New state to track if the answer is correct

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if isAnswerCorrect {
                // Show the next view if the answer is correct
                HidingPlace()  // Replace with your next view
            } else {
                // Show the EscapeRoute content if the answer is not correct yet
                VStack {
                    ProgressBar(progress: 0.7) // Adjust progress as necessary
                        .padding()
                    
                    if isFirstTextVisible {
                        TextType(fullText: "How did Tall Avyan escape?")
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    isFirstTextVisible = false
                                    isSecondTextVisible = true
                                }
                            }
                    }
                    
                    if isSecondTextVisible {
                        Spacer()
                        TextType(fullText: "I'll give you three clues. Figure it out.")
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                                    isSecondTextVisible = false
                                    isThirdTextVisible = true
                                }
                            }
                    }
                    
                    Spacer()
                    
                    if isThirdTextVisible {
                        VStack {
                            Button {
                                isActive1 = true
                                clue1Clicked = true
                                checkClues()  // Check if all clues are clicked
                            } label: {
                                Text("CLUE 1")
                                    .padding()
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                    .background {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.green)
                                    }
                            }
                            .sheet(isPresented: $isActive1) {
                                FirstClue1()
                            }
                            Spacer()
                            
                            Button {
                                isActive2 = true
                                clue2Clicked = true
                                checkClues()  // Check if all clues are clicked
                            } label: {
                                Text("CLUE 2")
                                    .padding()
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                    .background {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.green)
                                    }
                            }
                            .sheet(isPresented: $isActive2) {
                                SecondClue1()
                            }
                            Spacer()
                            
                            Button {
                                isActive3 = true
                                clue3Clicked = true
                                checkClues()  // Check if all clues are clicked
                            } label: {
                                Text("CLUE 3")
                                    .padding()
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                    .background {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.green)
                                    }
                            }
                            .sheet(isPresented: $isActive3) {
                                ThirdClue1()
                            }
                            Spacer()
                        }
                    }

                    // Conditionally show the text box after all clues are clicked
                    if showTextBox {
                        VStack {
                            Text("ENTER YOUR ANSWER")
                                .foregroundStyle(.green)
                                .font(.title)
                                .monospaced()
                            
                            TextField("Your answer here", text: $answerText)
                                .padding()
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundStyle(.green)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.green, lineWidth: 2)
                                }
                                .padding()
                            
                            Button(action: {
                                checkAnswer()  // Check if the answer is correct
                            }) {
                                Text("SUBMIT ANSWER")
                                    .padding()
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                    .background {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundStyle(.green)
                                    }
                            }
                        }
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Result"),
                          message: Text(isCorrectAnswer ? "Correct! Tall Avyan impersonated as his long-lost brother." : "Try again!"),
                          dismissButton: .default(Text("OK")) {
                              if isCorrectAnswer {
                                  isAnswerCorrect = true  // Move to the next view
                              }
                          })
                }
            }
        }
    }
    
    // Function to check if all clues have been clicked
    func checkClues() {
        if clue1Clicked && clue2Clicked && clue3Clicked {
            showTextBox = true  // Show the text box only after all clues are clicked
        }
    }
    
    // Function to check the answer
    func checkAnswer() {
        isCorrectAnswer = answerText.lowercased().trimmingCharacters(in: .whitespaces) == "impersonated as his twin brother"
        showAlert = true  // Show the alert regardless of the answer
    }
}

struct FirstClue1: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("This method requires technical skills and a clever plan.")
                        .padding()
                        .foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
            }
        }
    }
}

struct SecondClue1: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("It involves infiltrating secure systems undetected.")
                        .padding()
                        .foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
            }
        }
    }
}

struct ThirdClue1: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("U need a twin brother to commit this crime.")
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
    EscapeRoute()
}
