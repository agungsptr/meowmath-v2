//
//  SuccessAlertView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct SuccessAlertView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var opacity = 0.0
    @State private var scale = 0.7
    
    var questionId: Int
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 24)
                    .strokeBorder(Color("Pink"), lineWidth: 7)
                    .background(RoundedRectangle(cornerRadius: 24).fill(Color.white))
                    .frame(height: 375)
                    .overlay {
                        VStack {
                            Text("Yeay!")
                                .foregroundColor(Color("Pink"))
                                .fontWeight(.bold)
                                .font(.system(size: 24, design: .rounded))
                                .padding(.top, 10)
                            Spacer()
                            
                            HStack(alignment: .bottom) {
                                Image("BallFillGreen2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .offset(y: -5)
                                Image("Cat")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110)
                                Image("BallFill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .offset(y: -20)
                            }
                            Spacer()
                            
                            Text("Kamu berhasil menjawab soal cerita tentang pertambahan")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                                .font(.system(size: 16))
                            Spacer()
                            
                            if questionId == 1 {
                                NavigationLink(
                                    destination: Explanation1View(),
                                    label: {
                                        BtnExplanation()
                                    }
                                )
                            }
                            if questionId == 2 {
                                NavigationLink(
                                    destination: Explanation1View(),
                                    label: {
                                        BtnExplanation()
                                    }
                                )
                            }
                            
                            Button {
                                dismiss()
                            } label: {
                                Text("KEMBALI")
                                    .foregroundColor(Color("Grey"))
                                    .font(.system(size: 12, design: .rounded))
                                    .fontWeight(.bold)
                            }
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal, 40)
                
                Image("Medali")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .offset(x: -10, y: -40)
            }
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    opacity = 1.0
                    scale = 1.0
                }
            }
        }
    }
}

private struct BtnExplanation: View {
    var body: some View {
        Text("PEMBAHASAN")
            .padding(.vertical, 14)
            .padding(.horizontal, 60)
            .foregroundColor(.white)
            .font(.system(size: 12, design: .rounded))
            .fontWeight(.bold)
            .background(
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous
                )
                .fill(Color("Pink"))
            )
    }
}

struct SuccessAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessAlertView(questionId: 1)
    }
}
