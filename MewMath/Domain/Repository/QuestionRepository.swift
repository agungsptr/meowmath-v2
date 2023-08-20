//
//  QuestionRepository.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

protocol QuestionRepository {
    func getAll() throws -> [QuestionModel]
}
