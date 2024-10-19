//
//  ContentView.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    @State private var currentPage:Int = 0
    @State private var isPopUpVisble:Bool = false
    @State private var isPopUpVisble2:Bool = false
    let totalPages = 10
    var body: some View {
        ZStack{
            
                
                
                    StartPage()
                        .ignoresSafeArea()
                        .blur(radius: 0.6)
                
                
            VStack{
                ProgressBar(progress: 0.1)
                Spacer()
            }
            if isPopUpVisble{
                TemperaturePopUp(isVisible: $isPopUpVisble)
            }
            if isPopUpVisble2{
                UploadingPopUp(isVisible: $isPopUpVisble2)
            }
        }
        .onAppear{
                allPopUps()
        }
        
        
    }
    private func allPopUps(){
        showTempPopUpRandomly()
        showUploadPopUpRandomly()
    }
    private func showTempPopUpRandomly(){
        let randomTime = Double.random(in: 1...100)
        print("Random Time for temp pop up: \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime){
            isPopUpVisble = true
            print("Temp pop up should appear")
            showTempPopUpRandomly()
        }
    }
    private func showUploadPopUpRandomly(){
        let randomTime = Double.random(in: 1...100)
        print("Random Time for upload pop up: \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime){
            isPopUpVisble2 = true
            print("Upload pop up should appear")
            showUploadPopUpRandomly()
        }
    }
}

#Preview {
    ContentView()
}
