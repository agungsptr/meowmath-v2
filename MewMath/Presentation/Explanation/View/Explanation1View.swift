//
//  Explanation1View.swift
//  MewMath
//
//  Created by Muhammad Yusuf on 14/04/23.
//

import SwiftUI

struct Explanation1View: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var step: Int = 1
    @State var answer = Array(repeating: "", count: 4)
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("BgSemiBlue")
                    .ignoresSafeArea()
                Image("Flower")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .position(
                        x: screenWidth / 1.2,
                        y: screenHeight / 50
                    )
                Image("Flower")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .position(
                        x: screenWidth / 1.13,
                        y: screenHeight / 1.01
                    )
                
                RoundedRectangle(cornerRadius: 45)
                    .fill(Color.white)
                    .frame(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.9
                    )
                    .padding(.top, 24)
                
                VStack {
                    HStack {
                        Button {
                            if step == 1 {
                                dismiss()
                            }
                            if step <= 4 && step > 1{
                                step -= 1
                            }
                        } label: {
                            BtnBack()
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    Group {
                        Text("Pembahasan 1")
                            .font(.title)
                            .foregroundColor(Color.red)
                            .fontWeight(.bold)
                            .padding(.vertical, 12)
                        
                        HStack {
                            Text("Si Garong **mempunyai 4 buah** bola wol berwarna merah  di dalam keranjang mainannya. Kemudian Temannya datang dan ")
                                .font(.title2)
                            + Text("**memberinya 2 buah**")
                                .font(.title2)
                                .foregroundColor(.pink)
                            + Text(" bola wol berwarna hijau. Berapa banyak bola wol yang dimiliki Si Garong sekarang?")
                                .font(.title2)
                        }
                        .padding(.horizontal, 36)
                        .padding(.bottom, 24)
                    }
                    Spacer()
                }
                .padding(.top, 40)
                
                VStack {
                    if step == 1 {
                        HStack {
                            VStack {
                                Image("BallFill")
                                Image("BallFill")
                            }
                            VStack {
                                Image("BallFill")
                                Image("BallFill")
                            }
                            Text("=")
                                .font(.title)
                                .padding(.horizontal, 30)
                            Text("4")
                                .font(.title)
                        }
                        .onAppear {
                            answer = ["4", "", "", ""]
                        }
                    } else if step == 2 {
                        HStack{
                            Image("BallFillGreen")
                            Image("BallFillGreen")
                            Text("=")
                                .font(.largeTitle)
                                .padding(.horizontal, 30)
                            Text("2")
                                .font(.largeTitle)
                        }
                        .onAppear {
                            answer = ["4", "", "2", ""]
                        }
                    } else if step == 3 {
                        HStack{
                            Text("memberi")
                                .font(.title)
                                .foregroundColor(.pink)
                                .fontWeight(.bold)
                            Text("=")
                                .font(.largeTitle)
                                .padding(.horizontal, 24)
                                .opacity(0.5)
                            Text("+")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .onAppear {
                            answer = ["4", "+", "2", ""]
                        }
                    } else if step == 4 {
                        HStack{
                            Text("4 + 2 = ?")
                                .font(.largeTitle)
                        }
                        .onAppear {
                            answer = ["4", "+", "2", "6"]
                        }
                    }
                }
                .padding(.top, 64)
                
                VStack {
                    Spacer()
                    HStack {
                        AnswerRectangel(isSelected: step == 1, text: answer[0])
                        AnswerRectangel(isSelected: step == 3, text: answer[1])
                        AnswerRectangel(isSelected: step == 2, text: answer[2])
                        Text("=").font(.title)
                        AnswerRectangel(isSelected: step == 4, text: answer[3])
                    }
                    if step == 4 {
                        NavigationLink(
                            destination: MapView(),
                            label: {
                                BtnNext(text: "Kembali ke peta")
                            }
                        )
                    } else {
                        Button {
                            if step < 4 {
                                step  += 1
                            } else {
                                step = 4
                            }
                        } label: {
                            BtnNext(text: "Lanjut")
                        }
                    }
                }
                .padding(.bottom, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

private struct BtnNext: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.bold)
            .padding()
            .foregroundColor(.white)
            .frame(width: 300)
            .background(
                RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                )
                .fill(.pink))
    }
}

private struct AnswerRectangel: View {
    var isSelected: Bool
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("SemiGray"))
            if isSelected {
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color("PinkShadow"), lineWidth: 3)
            }
            Text(text)
                .font(.title)
        }
        .frame(width: 57, height: 57)
            .padding(.horizontal, 2)
    }
}

struct Explanation1View_Previews: PreviewProvider {
    static var previews: some View {
        Explanation1View()
    }
}
