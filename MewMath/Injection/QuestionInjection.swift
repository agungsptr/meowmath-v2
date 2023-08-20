//
//  QuestionInjection.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

struct QuestionInject {
    func useCase() -> QuestionUseCase {
        let repo = QuestionRepositoryImpl(dataSource: QuestionDataSourceImpl())
        return QuestionUseCaseImpl(repository: repo)
    }
}
