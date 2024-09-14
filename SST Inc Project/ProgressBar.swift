//
//  ProgressBar.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 13/9/24.
//

import SwiftUI

struct ProgressBar: View {
    @State var progress: CGFloat = 0.7
    @State var totalWidth: CGFloat = 300
    @State var dashWidth: CGFloat = 8
    @State var dashSpacing: CGFloat = 2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("\(Int(progress * 100)) %")
                .bold()
                .font(.title3)
            ZStack(alignment: .leading){
                Rectangle()
                    .stroke(lineWidth: 2)
                    .frame(width: totalWidth, height: 20)
                HStack(spacing: dashSpacing){
                    ForEach(0 ..< Int((progress * totalWidth) / (dashWidth + dashSpacing)), id: \.self) { item in
                        Rectangle()
                            .frame(width: dashWidth, height:15)
                    }
                }
                .offset(x: 3)
            }
        }
        .foregroundStyle(.green)
    }
}

#Preview {
    ProgressBar()
}
