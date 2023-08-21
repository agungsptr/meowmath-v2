//
//  QuestionDataSource.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

protocol QuestionDataSource {
    func getAll() throws -> [QuestionModel]
}

struct QuestionDataSourceImpl: QuestionDataSource {
    func getAll() throws -> [QuestionModel] {
        let data: [QuestionModel] = try loadJson("QuestionData.json")
        return data
    }
}
