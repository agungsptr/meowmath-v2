//
//  Question2View.swift
//  MewMath
//
//  Created by Agung Saputra on 19/08/23.
//

import SwiftUI

struct Question2View: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = QuestionViewModel(questionId: 2)
    @State private var fish = ["dragable": true, "show": true]
    private let fishSize: CGFloat = 100
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
                    ).padding(.top, 15)
                    HStack {
                        Image("Cat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .offset(y: -10)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                
                Image("Bowl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .position(x: screenWidth * 1/2, y: screenHeight * 4/9)
                
                VStack {
                    Spacer()
                    
                    if viewModel.step == 0 {
                        InfoBoxView(text: "Masukkan Ikan kedalam mangkuk!")
                    } else if viewModel.step == 2 {
                        InfoBoxView(text: "Beri 2 ikan ke Garong")
                    }
                    
                    if viewModel.step == 1 {
                        OptionBoxView(
                            step: $viewModel.step,
                            questionText: "Berapa jumlah ikan yang ada di mangkuk?",
                            correctAnswer: "\(viewModel.question.answers[0])",
                            answerList: $viewModel.answerList,
                            answerIndex: 0,
                            showFailAlert: $viewModel.showFailAlert,
                            showSuccessAlert: $viewModel.showSuccessAlert
                        )
                    } else if viewModel.step == 3 {
                        OptionBoxView(
                            step: $viewModel.step,
                            questionText: "Berapa banyak ikan yang kamu berikan ke Garong?",
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
                            questionText: "Berapa jumlah ikan yang belum dimakan?",
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
                
                if fish["show"]! {
                    ForEach(0..<4, id: \.self) { idx in
                        Image("FishFill")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: fishSize * viewModel.itemScale[idx],
                                height: fishSize * viewModel.itemScale[idx]
                            )
                            .position(
                                x: viewModel.itemPosition[idx][0],
                                y: viewModel.itemPosition[idx][1]
                            )
                            .gesture(
                                dragGesture(
                                    itemIndex: idx,
                                    dragable: fish["dragable"]!
                                )
                            )
                            .onAppear {
                                viewModel.itemPosition[idx] = [
                                    screenWidth * (CGFloat(idx) + 1) / 5,
                                    screenHeight * 4/7
                                ]
                            }
                    }
                    
                    ForEach(0..<2, id: \.self) { idx in
                        Image("FishFill")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: fishSize * viewModel.itemScale[4+idx],
                                height: fishSize * viewModel.itemScale[4+idx]
                            )
                            .position(
                                x: viewModel.itemPosition[4+idx][0],
                                y: viewModel.itemPosition[4+idx][1]
                            )
                            .gesture(
                                dragGesture(
                                    itemIndex: 4+idx,
                                    dragable: fish["dragable"]!
                                )
                            )
                            .onAppear {
                                viewModel.itemPosition[4+idx] = [
                                    screenWidth * (CGFloat(idx) + 2) / 5,
                                    screenHeight * 0.63
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
                    SuccessAlertView(questionId: 2)
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
                if viewModel.step == 0 && totalItemOnTarget == 6 {
                    viewModel.step += 1
                } else if viewModel.step == 2 && totalItemOnTarget == 4 {
                    viewModel.step += 1
                }
                
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    viewModel.itemScale[itemIndex] = 0.7
                }
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            })
    }
}

struct Question2View_Previews: PreviewProvider {
    static var previews: some View {
        Question2View()
    }
}
