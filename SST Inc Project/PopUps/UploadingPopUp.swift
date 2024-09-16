//
//  UploadingPopUp.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 14/9/24.
//

import SwiftUI

struct UploadingPopUp: View {
    @State var progress: CGFloat = 0.0
    @State var totalWidth: CGFloat = 300
    @State var dashWidth: CGFloat = 8
    @State var dashSpacing: CGFloat = 2
    @State var isUploading: Bool = false
    @Binding var isVisible:Bool
    let monospaceFont = Font
        .system(size: 17)
        .monospaced()
    var body: some View {
        if isVisible{
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 380, height: 150)
                    .overlay{
                        Rectangle()
                            .stroke(Color.green, lineWidth: 5)
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 380, height: 20)
                                HStack {
                                    Text(" HACKED")
                                        .foregroundStyle(.black)
                                        .bold()
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                    }
                
                VStack(spacing: 5){
                    HStack{
                        Spacer()
                        Text("Complete the upload")
                            .font(monospaceFont)
                        Spacer()
                    }
                    
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
                    .padding(.bottom, 7)
                    Button{
                        startUpload()
                    }label:{
                        Rectangle()
                            .frame(width: 120, height: 50)
                            .foregroundStyle(.black)
                            .overlay {
                                Rectangle()
                                    .stroke(Color.green, lineWidth: 2)
                                
                                Text("Start Upload")
                                    .font(monospaceFont)
                                
                                    .foregroundStyle(.green)
                            }
                    }
                }
            }
            .foregroundStyle(.green)
        }
    }
        private func startUpload(){
            isUploading = true
            Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true){ timer in
                if progress < 1.0{
                    progress += 0.1
                    checkUpload()
                }else{
                    timer.invalidate()
                    isUploading = false
                    isVisible = false
                }
                
            }
        }
    private func checkUpload(){
        if progress >= 1.0{
            isVisible = false
        }
    }
}


#Preview {
    UploadingPopUp(isVisible: .constant(true))
}
