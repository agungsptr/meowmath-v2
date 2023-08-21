//
//  QuestionViewModel.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

@MainActor
class QuestionViewModel: ObservableObject {
    @Published var data: [QuestionModel] = []
    @Published var question: QuestionModel = QuestionModel(id: 1, questionText: "", answers: [])
    
    @Published var step = 0
    @Published var showFailAlert = false
    @Published var showSuccessAlert = false
    @Published var itemPosition = Array(repeating: [CGFloat(0), CGFloat(0)], count: 6)
    @Published var itemScale = Array(repeating: CGFloat(0.7), count: 6)
    @Published var itemOnTarget = Array(repeating: false, count: 6)
    @Published var answerList = Array(repeating: "?", count: 4)
    
    private let useCase = QuestionInject().useCase()
    
    init(questionId: Int) {
        getAll()
        getById(id: questionId)
    }
    
    func getAll() {
        let res = useCase.getAll()
        switch res {
        case .success(let data):
            self.data = data
        case .failure(let error):
            print(error)
        }
    }
    
    func getById(id: Int) {
        for question in data where question.id == id {
            self.question = question
            break
        }
    }
    
    func getQuestionByStep(step: Int) -> String {
        let questionStep = self.question.questionText.components(separatedBy: ".")
        switch step {
        case ...1:
            return questionStep[0]
        case 2...4:
            return questionStep[1]
        default:
            return questionStep[2]
        }
    }
}
