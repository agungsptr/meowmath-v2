//
//  QuestionModel.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

struct QuestionModel: Hashable, Codable, Identifiable {
    var id: Int
    var questionText: String
    var answers: [String]
}
