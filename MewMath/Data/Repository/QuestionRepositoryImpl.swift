//
//  QuestionRepositoryImpl.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

struct QuestionRepositoryImpl: QuestionRepository {
    var dataSource: QuestionDataSource
    
    func getAll() throws -> [QuestionModel] {
        let data = try dataSource.getAll()
        return data
    }
}
