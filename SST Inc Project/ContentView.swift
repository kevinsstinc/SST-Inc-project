//
//  ContentView.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    @State private var currentPage: Int = 0
    @State private var isPopUpVisible: Bool = false
    @State private var isPopUpVisible2: Bool = false
    
    let totalPages = 10
    var body: some View {
        ZStack {
            if currentPage == 0 {
                StartPage()
                    .ignoresSafeArea()
                    .blur(radius: 0.6)
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 490)
                    .blur(radius: 100)
                    .overlay {
                        VStack {
                            Spacer()
                            Text("SST INC BANK\n\nTHE HIJACK")
                                .foregroundStyle(.green)
                                .font(.system(size: 60))
                                .multilineTextAlignment(.center)
                                .bold()
                                .padding()
                                .monospaced()
                            Spacer()
                            Button {
                                currentPage = 1
                            } label: {
                                Text("BEGIN?")
                                    .padding()
                                    .monospaced()
                                    .foregroundStyle(.black)
                                    .background {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(.green)
                                            .frame(width: 150, height: 40)
                                    }
                            }
                        }
                    }
                
                VStack {
                    ProgressBar(progress: 0.1)
                    Spacer()
                }
                
                if isPopUpVisible {
                    TemperaturePopUp(isVisible: $isPopUpVisible)
                }
                if isPopUpVisible2 {
                    UploadingPopUp(isVisible: $isPopUpVisible2)
                }
                
            } else if currentPage == 1 {
                EncryptedCode()
            }
        }
        // Correctly attach `.onAppear` here, applied to the `ZStack`
        .onAppear {
            allPopUps()
        }
    }
    
    private func allPopUps() {
        showTempPopUpRandomly()
        showUploadPopUpRandomly()
    }
    
    private func showTempPopUpRandomly() {
        let randomTime = Double.random(in: 1...100)
        print("Random Time for temp pop up: \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime) {
            isPopUpVisible = true
            print("Temp pop up should appear")
            showTempPopUpRandomly()
        }
    }
    
    private func showUploadPopUpRandomly() {
        let randomTime = Double.random(in: 1...100)
        print("Random Time for upload pop up: \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime) {
            isPopUpVisible2 = true
            print("Upload pop up should appear")
            showUploadPopUpRandomly()
        }
    }
}

#Preview {
    ContentView()
}
