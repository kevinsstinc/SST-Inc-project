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
        }
        VStack{
            Button{
                isPopUpVisble = true
            }label:{
                Text("Show temp popup")
            }
            TemperaturePopUp(isVisible: $isPopUpVisble)
        }
    }
}

#Preview {
    ContentView()
}
