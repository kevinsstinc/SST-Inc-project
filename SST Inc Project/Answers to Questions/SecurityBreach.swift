//
//  SecurityBreach.swift
//  SST Inc Project
//
//  Created by Joseph Kevin Fredric on 19/10/24.
//

import SwiftUI

struct SecurityBreach: View {
    @State private var nextPage = false
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if nextPage{
                MoneyRemaining()
            }else{
                VStack(alignment: .leading, spacing: 15) {
                    ScrollView{
                        ProgressBar(progress: 0.5)
                        TextType(fullText: "🚨 SECURITY 🚨 BREACH REPORT ")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(Color.green)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                        
                        Divider()
                            .background(Color.gray)
                        
                        
                        TextType(fullText: "HACKER IDENTIFIED:")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Color.green)
                        
                        TextType(fullText: "tall_avyan")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        
                        Divider()
                            .background(Color.gray)
                        
                        
                        TextType(fullText: "INCIDENT REPORT")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Color.green)
                        
                        TextType(fullText: "DATE: 19/10/24")
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                        
                        TextType(fullText: "TIME: 12:00 AM")
                            .font(.system(size: 18))
                            .foregroundColor(Color.white)
                        
                        TextType(fullText: "DETAILS:")
                            .font(.system(size: 18))
                            .foregroundColor(Color.green)
                        
                        TextType(fullText: "• Incoin stolen\n• Systems infected by Zbot.")
                            .font(.system(size: 16))
                            .foregroundColor(Color.white)
                            .padding(.leading, 10)
                        
                        Divider()
                            .background(Color.gray)
                        
                        
                        TextType(fullText: "SECURITY MEASURES:")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(Color.green)
                        
                        TextType(fullText: "PROTECTION STATUS: ACTIVATED")
                            .font(.system(size: 18))
                            .foregroundColor(Color.green)
                            .multilineTextAlignment(.center)
                        
                        
                        Spacer()
                        
                        TextType(fullText: "FOR INTERNAL USE ONLY")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                            .padding(.bottom)
                        
                        TextType(fullText: "© 2024 SST INC. SECURITY AGENCY")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                        Button{
                            nextPage = true
                        }label:{
                            Text("NEXT?")
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
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black.opacity(0.8))
                            .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 0)
                    )
                    .padding()
                }
            }
        }
    }
}

#Preview {
    SecurityBreach()
}
