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
    let totalPages = 10
    var body: some View {
        ZStack{
            
            Color.black.ignoresSafeArea()
            VStack{
                ProgressBar()
                Spacer()
            }
            if isPopUpVisble{
                TemperaturePopUp(isVisible: $isPopUpVisble)
            }
        }
        .onAppear{
                showTempPopUpRandomly()
        }
            
        
    }
    private func showTempPopUpRandomly(){
        let randomTime = Double.random(in: 1...100)
        print("Random Time: \(randomTime)")
        DispatchQueue.main.asyncAfter(deadline: .now() + randomTime){
            isPopUpVisble = true
            print("Temp pop up should appear")
            showTempPopUpRandomly()
        }
    }
}

#Preview {
    ContentView()
}
