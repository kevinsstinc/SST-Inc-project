//
//  EndingPage.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 20/10/24.
//

import SwiftUI

struct EndingPage: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ProgressBar(progress: 1.0)
                   
                TextType(fullText: "🎉YOU HAVE COMPLETED OUR APP!🎉")
                    .font(.system(size:65))
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    EndingPage()
}
