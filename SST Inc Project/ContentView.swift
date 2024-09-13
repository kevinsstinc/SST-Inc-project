//
//  ContentView.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ProgressBar()
            }
        }
    }
}

#Preview {
    ContentView()
}
