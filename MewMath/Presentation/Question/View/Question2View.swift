//
//  Question2View.swift
//  MewMath
//
//  Created by Agung Saputra on 19/08/23.
//

import SwiftUI

struct Question2View: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = QuestionViewModel(questionId: 2)
    @State private var step = 0
    @State private var showAlert = false
    @State private var showSuccessAlert = false
    
    @State private var fish = ["dragable": true, "show": true]
    
    @State private var itemPosition = Array(repeating: [CGFloat(0), CGFloat(0)], count: 6)
    @State private var itemScale = Array(repeating: CGFloat(0.7), count: 6)
    @State private var itemOnTarget = Array(repeating: false, count: 6)
    
    @State var answerList = Array(repeating: "?", count: 4)
    
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
                        questionNumber: vm.question.id,
                        question: vm.getQuestionByStep(step: step)
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
                
                Image("bowl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .position(x: screenWidth * 1/2, y: screenHeight * 4/9)
                
                VStack {
                    Spacer()
                    
                    if step == 0 {
                        InfoBoxView(text: "Masukkan Ikan kedalam mangkuk!")
                    } else if step == 2 {
                        InfoBoxView(text: "Beri 2 ikan ke Garong")
                    }
                    
                    if step == 1 {
                        OptionBoxView(
                            step: $step,
                            questionText: "Berapa jumlah ikan yang ada di mangkuk?",
                            correctAnswer: "\(vm.question.answers[0])",
                            answerList: $answerList,
                            answerIndex: 0,
                            showFailAlert: $showAlert,
                            showSuccessAlert: $showSuccessAlert
                        )
                    } else if step == 3 {
                        OptionBoxView(
                            step: $step,
                            questionText: "Berapa banyak ikan yang kamu berikan ke Garong?",
                            correctAnswer: "\(vm.question.answers[1])",
                            answerList: $answerList,
                            answerIndex: 2,
                            showFailAlert: $showAlert,
                            showSuccessAlert: $showSuccessAlert
                        )
                    } else if step == 4 {
                        OptionBoxView(
                            step: $step,
                            questionText: "Menurut kamu, operasi apa yang cocok untuk soal tersebut?",
                            correctAnswer: "\(vm.question.answers[2])",
                            answerList: $answerList,
                            answerIndex: 1,
                            showFailAlert: $showAlert,
                            showSuccessAlert: $showSuccessAlert
                        )
                    } else if step == 5 {
                        OptionBoxView(
                            step: $step,
                            questionText: "Berapa jumlah ikan yang belum dimakan?",
                            correctAnswer: "\(vm.question.answers[3])",
                            answerList: $answerList,
                            answerIndex: 3,
                            showFailAlert: $showAlert,
                            showSuccessAlert: $showSuccessAlert
                        )
                    }
                    AnswerBoxView(selectedBox: step, answerList: $answerList)
                }
                
                if fish["show"]! {
                    ForEach(0..<4, id: \.self) { i in
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: fishSize * itemScale[i],
                                height: fishSize * itemScale[i]
                            )
                            .position(
                                x: itemPosition[i][0],
                                y: itemPosition[i][1]
                            )
                            .gesture(
                                dragGesture(
                                    itemIndex: i,
                                    dragable: fish["dragable"]!
                                )
                            )
                            .onAppear {
                                itemPosition[i] = [
                                    screenWidth * (CGFloat(i) + 1) / 5,
                                    screenHeight * 4/7
                                ]
                            }
                    }
                    
                    ForEach(0..<2, id: \.self) { i in
                        Image("Ikan")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: fishSize * itemScale[4+i],
                                height: fishSize * itemScale[4+i]
                            )
                            .position(
                                x: itemPosition[4+i][0],
                                y: itemPosition[4+i][1]
                            )
                            .gesture(
                                dragGesture(
                                    itemIndex: 4+i,
                                    dragable: fish["dragable"]!
                                )
                            )
                            .onAppear {
                                itemPosition[4+i] = [
                                    screenWidth * (CGFloat(i) + 2) / 5,
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
                
                if showAlert {
                    FailAlertView()
                }
                
                if showSuccessAlert {
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
                    self.itemPosition[itemIndex] = [value.location.x, value.location.y]
                }
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    self.itemScale[itemIndex] = 1.0
                }
            })
            .onEnded({ _ in
                self.itemOnTarget[itemIndex] = checkItemOnTarget(self.itemPosition[itemIndex])

                let totalItemOnTarget = countItemOnTarget(self.itemOnTarget)
                if step == 0 && totalItemOnTarget == 6 {
                    step += 1
                } else if step == 2 && totalItemOnTarget == 4 {
                    step += 1
                }

                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 1)) {
                    self.itemScale[itemIndex] = 0.7
                }
                UINotificationFeedbackGenerator().notificationOccurred(.success)
            })
    }
    
    private func checkItemOnTarget(_ position: [CGFloat]) -> Bool {
        let xOver = abs(screenWidth * 1/2 - position[0])
        let yOver = abs(screenHeight * 4/9 - 25 - position[1])
        return (xOver < 130 && yOver < 54)
    }
    
    private func countItemOnTarget(_ arr: [Bool]) -> Int {
        return arr.reduce(0) {
            $1 ? $0 + 1 : $0
        }
    }
}

struct Question2View_Previews: PreviewProvider {
    static var previews: some View {
        Question2View()
    }
}
