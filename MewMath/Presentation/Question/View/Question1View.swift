//
//  QuestionView.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import SwiftUI

struct QuestionView1: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = QuestionViewModel(questionId: 1)
    @State private var redBall = ["dragable": true, "show": true]
    @State private var greenBall = ["dragable": true, "show": true]
    private let ballSize: CGFloat = 100
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("BgQuest")
                    .resizable()
                    .ignoresSafeArea(.all)
                
                VStack {
                    QuestionBoxView(
                        questionNumber: viewModel.question.id,
                        question: viewModel.getQuestionByStep(step: viewModel.step)
                    )
                    .padding(.top, 15)
                    
                    HStack {
                        Image("Cat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(y: -10)
                        Spacer()
                        if viewModel.step >= 2 {
                            Image("CatFemale")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .offset(y: -10)
                        }
                    }
                    .padding()
                    Spacer()
                }
                
                Image("Basket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260)
                    .position(x: screenWidth * 1/2, y: screenHeight * 4/9)
                
                VStack {
                    Spacer()
                    [0, 2].contains(viewModel.step) ? InfoBoxView(text: "Masukkan bola kedalam keranjang!") : nil
                    if viewModel.step == 1 {
                        OptionBoxView(
                            step: $viewModel.step,
                            questionText: "Berapa jumlah wol yang ada dikeranjang saat ini?",
                            correctAnswer: "\(viewModel.question.answers[0])",
                            answerList: $viewModel.answerList,
                            answerIndex: 0,
                            showFailAlert: $viewModel.showFailAlert,
                            showSuccessAlert: $viewModel.showSuccessAlert
                        )
                    } else if viewModel.step == 3 {
                        OptionBoxView(
                            step: $viewModel.step,
                            questionText: "Berapa jumlah bola wol hijau yang diberikan?",
                            correctAnswer: "\(viewModel.question.answers[1])",
                            answerList: $viewModel.answerList,
                            answerIndex: 2,
                            showFailAlert: $viewModel.showFailAlert,
                            showSuccessAlert: $viewModel.showSuccessAlert
                        )
                    } else if viewModel.step == 4 {
                        OptionBoxView(
                            step: $viewModel.step,
                            questionText: "Menurut kamu, operasi apa yang cocok untuk soal tersebut?",
                            correctAnswer: "\(viewModel.question.answers[2])",
                            answerList: $viewModel.answerList,
                            answerIndex: 1,
                            showFailAlert: $viewModel.showFailAlert,
                            showSuccessAlert: $viewModel.showSuccessAlert
                        )
                    } else if viewModel.step == 5 {
                        OptionBoxView(
                            step: $viewModel.step,
                            questionText: "Berapa jumlah wol yang ada dikeranjang saat ini?",
                            correctAnswer: "\(viewModel.question.answers[3])",
                            answerList: $viewModel.answerList,
                            answerIndex: 3,
                            showFailAlert: $viewModel.showFailAlert,
                            showSuccessAlert: $viewModel.showSuccessAlert
                        )
                    }
                    AnswerBoxView(
                        selectedBox: viewModel.step,
                        answerList: $viewModel.answerList
                    )
                }
                
                if redBall["show"]! {
                    ForEach(0..<4, id: \.self) { idx in
                        Image("BallFill")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: ballSize * viewModel.itemScale[idx],
                                height: ballSize * viewModel.itemScale[idx])
                            .position(
                                x: viewModel.itemPosition[idx][0],
                                y: viewModel.itemPosition[idx][1]
                            )
                            .gesture(
                                dragGesture(
                                    itemIndex: idx,
                                    dragable: redBall["dragable"]!
                                )
                            )
                            .onAppear {
                                viewModel.itemPosition[idx] = [
                                    screenWidth * (CGFloat(idx) + 1) / 5,
                                    screenHeight * 4/7
                                ]
                            }
                    }
                }
                
                if viewModel.step >= 2 && greenBall["show"]! {
                    ForEach(0..<2, id: \.self) { idx in
                        Image("BallFillGreen")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: (ballSize - 14) * viewModel.itemScale[4+idx],
                                height: ballSize * viewModel.itemScale[4+idx])
                            .position(
                                x: viewModel.itemPosition[4+idx][0],
                                y: viewModel.itemPosition[4+idx][1]
                            )
                            .gesture(
                                dragGesture(
                                    itemIndex: 4+idx,
                                    dragable: greenBall["dragable"]!
                                )
                            )
                            .onAppear {
                                viewModel.itemPosition[4+idx] = [
                                    screenWidth * (CGFloat(idx) + 2) / 5,
                                    screenHeight * 3/5
                                ]
                            }
                    }
                }
                
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            BtnBack()
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                if viewModel.showFailAlert {
                    FailAlertView()
                }
                
                if viewModel.showSuccessAlert {
                    SuccessAlertView(questionId: 1)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func dragGesture(itemIndex: Int, dragable: Bool) -> some Gesture {
        return DragGesture()
            .onChanged({ value in
                if dragable {
                    viewModel.itemPosition[itemIndex] = [value.location.x, value.location.y]
                }
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    viewModel.itemScale[itemIndex] = 1.0
                }
            })
            .onEnded({ _ in
                viewModel.itemOnTarget[itemIndex] = checkItemOnTarget(
                    position: viewModel.itemPosition[itemIndex],
                    screenWidth: screenWidth,
                    screenHeight: screenHeight
                )
                
                let totalItemOnTarget = countItemOnTarget(viewModel.itemOnTarget)
                if viewModel.step == 0 && totalItemOnTarget == 4 {
                    viewModel.step += 1
                } else if viewModel.step == 2 && totalItemOnTarget == 6 {
                    viewModel.step += 1
                }
                
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    viewModel.itemScale[itemIndex] = 0.7
                }
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            })
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView1()
    }
}
