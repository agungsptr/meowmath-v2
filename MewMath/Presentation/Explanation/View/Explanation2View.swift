//
//  Explanation2View.swift
//  MewMath
//
//  Created by Agung Saputra on 20/08/23.
//

import SwiftUI

struct Explanation2View: View {
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
                        Text("Pembahasan 2")
                            .font(.title)
                            .foregroundColor(Color.red)
                            .fontWeight(.bold)
                            .padding(.vertical, 12)
                        
                        HStack {
                            Text("Si Garong **mempunyai 6 potong** ikan di mangkuk makanannya. Kemudian Garong ")
                                .font(.title2)
                            + Text("**memakan 2 potong**")
                                .font(.title2)
                                .foregroundColor(.pink)
                            + Text(" ikan. Berapa banyak potong ikan yang tersisa?")
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
                                ImgFish()
                                ImgFish()
                                ImgFish()
                            }
                            VStack {
                                ImgFish()
                                ImgFish()
                                ImgFish()
                            }
                            Text("=")
                                .font(.title)
                                .padding(.horizontal, 30)
                            Text("6")
                                .font(.title)
                        }
                        .onAppear {
                            answer = ["6", "", "", ""]
                        }
                    } else if step == 2 {
                        HStack{
                            Image("Cat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                            VStack {
                                ImgFish(boneOnly: true)
                                ImgFish(boneOnly: true)
                            }
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
                            Text("memakan")
                                .font(.title)
                                .foregroundColor(.pink)
                                .fontWeight(.bold)
                            Text("=")
                                .font(.largeTitle)
                                .padding(.horizontal, 24)
                                .opacity(0.5)
                            Text("-")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .onAppear {
                            answer = ["6", "-", "2", ""]
                        }
                    } else if step == 4 {
                        HStack{
                            Text("6 - 2 = ?")
                                .font(.largeTitle)
                        }
                        .onAppear {
                            answer = ["6", "-", "2", "4"]
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

private struct ImgFish: View {
    var boneOnly = false
    var body: some View {
        Image(boneOnly ? "fishbone" : "Ikan")
            .resizable()
            .scaledToFit()
            .frame(width: 70)
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

struct Explanation2View_Previews: PreviewProvider {
    static var previews: some View {
        Explanation2View()
    }
}
