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
    
    private let db = QuestionInject().useCase()
    
    init(questionId: Int) {
        getAll()
        getById(id: questionId)
    }
    
    func getAll() {
        let res = db.getAll()
        switch res {
        case .success(let data):
            self.data = data
        case .failure(let error):
            print(error)
        }
    }
    
    func getById(id: Int) {
        for question in data {
            if question.id == id {
                self.question = question
                break
            }
        }
    }
    
    func getQuestionByStep(step: Int) -> String {
        let questionStep = self.question.questionText.components(separatedBy: ".")
        if (step <= 1) {
            return questionStep[0]
        } else if (step > 1 && step <= 4) {
            return questionStep[1]
        } else {
            return questionStep[2]
        }
    }
}
