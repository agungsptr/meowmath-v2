//
//  OptionGenerator.swift
//  MewMath
//
//  Created by Agung Saputra on 21/08/23.
//

import Foundation

func generateOption(_ specifiedValue: String) -> [String] {
    var options: Set<String> = [specifiedValue]
    while options.count < 4 {
        let randomInt = Int.random(in: 0..<10)
        if "\(randomInt)" != specifiedValue {
            options.insert("\(randomInt)")
        }
    }
    var arrayOptions = Array(options)
    shuffleArray(of: &arrayOptions)
    return arrayOptions
}

func shuffleArray<T>(of array: inout [T]) {
    for numI in stride(from: array.count - 1, through: 1, by: -1) {
        let numJ = Int.random(in: 0...numI)
        if numI != numJ {
            array.swapAt(numI, numJ)
        }
    }
}
