//
//  OptionBoxView.swift
//  MewMath
//
//  Created by Agung Saputra on 19/08/23.
//

import SwiftUI

struct OptionBoxView: View {
    @Binding var step: Int
    var questionText: String
    var correctAnswer: String
    @Binding var answerList: [String]
    var answerIndex: Int
    @Binding var showFailAlert: Bool
    @Binding var showSuccessAlert: Bool
    
    @State private var optionList: [String] = []
    @State private var opacity = 0.0
    @State private var scale = 0.7
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .fill(Color("Green"))
            .frame(height: 150)
            .overlay(VStack {
                Text(questionText)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                HStack {
                    ForEach(optionList, id: \.self) { option in
                        Button(action: {
                            answerList[answerIndex] = "\(option)"
                            if option == correctAnswer {
                                showFailAlert = false
                                if step == 5 {
                                    showSuccessAlert = true
                                } else {
                                    step = step < 5 ? (step + 1) : step
                                }
                            } else {
                                showFailAlert = true
                            }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("BrokenWhite"))
                                    .frame(width: 70, height: 60)
                                    .offset(y: 5)
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.white)
                                    .frame(width: 70, height: 60)
                                Text("\(option)")
                                    .font(.system(size: 40, design: .rounded))
                            }.padding(.horizontal, 2)
                        })
                    }
                }
            })
            .padding(.horizontal)
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                if correctAnswer == "+" || correctAnswer == "-" {
                    optionList = ["+", "-"]
                } else {
                    optionList = generateOption(correctAnswer)
                }
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    opacity = 1.0
                    scale = 1.0
                }
            }
    }
}

struct OptionBoxView_Previews: PreviewProvider {
    static var previews: some View {
        OptionBoxView(
            step: .constant(0),
            questionText: "Lorem ipsum dolor emet?",
            correctAnswer: "0",
            answerList: .constant(["0", "0", "0", "0"]),
            answerIndex: 0,
            showFailAlert: .constant(false),
            showSuccessAlert: .constant(false)
        )
    }
}
