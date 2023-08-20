//
//  QuestionUseCase.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

protocol QuestionUseCase {
    func getAll() -> Result<[QuestionModel], Error>
}

struct QuestionUseCaseImpl: QuestionUseCase {
    var repository: QuestionRepository
    
    func getAll() -> Result<[QuestionModel], Error> {
        do {
            let data = try repository.getAll()
            return .success(data)
        } catch {
            print("Error: \(error.localizedDescription)")
            return .failure(error)
        }
    }
}
