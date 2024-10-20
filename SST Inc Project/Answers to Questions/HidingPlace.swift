//
//  HidingPlace.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 20/10/24.
//

import SwiftUI

struct HidingPlace: View {
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

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ProgressBar(progress: 0.2)
                    .padding()
                
                if isFirstTextVisible {
                    TextType(fullText: "Where is Tall Avyan hiding now?")
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
                    TextType(fullText: "I'll give you three riddles. Figure it out.")
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
                            FirstClue()
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
                            SecondClue()
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
                            ThirdClue()
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
                      message: Text(isCorrectAnswer ? "Correct! Tall Avyan is hiding in your house." : "Try again!"),
                      dismissButton: .default(Text("OK")))
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
        isCorrectAnswer = answerText.lowercased().trimmingCharacters(in: .whitespaces) == "in my house"
        showAlert = true  // Show the alert regardless of the answer
    }
}

struct FirstClue: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("This location is in your neighbourhood")
                        .padding()
                        .foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
            }
        }
    }
}

struct SecondClue: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("A place you spend 8 hours a day sleeping and possibly more time gaming.")
                        .padding()
                        .foregroundStyle(.green)
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
            }
        }
    }
}

struct ThirdClue: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ScrollView {
                    Text("This place would not exist if you are homeless 💀")
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
    HidingPlace()
}
