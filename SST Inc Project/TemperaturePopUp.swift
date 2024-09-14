//
//  TemperaturePopUp.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 14/9/24.
//

import SwiftUI

struct TemperaturePopUp: View {
    @Binding var isVisible: Bool
    @State private var tempNum: Int = 65
    
    var body: some View {
        if isVisible {
            ZStack {
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 150)
                    .overlay {
                        Rectangle()
                            .stroke(Color.green, lineWidth: 5)
                        
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 300, height: 20)
                                HStack {
                                    Text(" HACKED")
                                        .bold()
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        
                        VStack {
                            Text("Set the temperature to 73°C")
                                .foregroundStyle(.green)
                            
                            HStack {
                                Button {
                                    tempNum -= 1
                                    checkTemp()
                                } label: {
                                    Rectangle()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(.black)
                                        .overlay {
                                            Rectangle()
                                                .stroke(Color.green, lineWidth: 3)
                                            Text("<")
                                                .foregroundStyle(.green)
                                        }
                                }
                                
                                Text("\(tempNum)")
                                    .foregroundStyle(.green)
                                    .padding()
                                    .background {
                                        Rectangle()
                                            .frame(width: 50, height: 50)
                                            .foregroundStyle(.black)
                                            .overlay {
                                                Rectangle()
                                                    .stroke(Color.green, lineWidth: 3)
                                            }
                                    }
                                    .padding(.horizontal, 10)
                                
                                Button {
                                    tempNum += 1
                                    checkTemp()
                                } label: {
                                    Rectangle()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(.black)
                                        .overlay {
                                            Rectangle()
                                                .stroke(Color.green, lineWidth: 3)
                                                
                                            Text(">")
                                                .foregroundStyle(.green)
                                        }
                                }
                            }
                        }
                    }
            }
        }
    }
    
    private func checkTemp() {
        if tempNum >= 73 {
            isVisible = false
        }
    }
}

#Preview {
    TemperaturePopUp(isVisible: .constant(true))
}
