//
//  Utils.swift
//  MewMath
//
//  Created by Agung Saputra on 17/08/23.
//

import Foundation

func loadJsonFile<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main module.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

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
    for i in stride(from: array.count - 1, through: 1, by: -1) {
        let j = Int.random(in: 0...i)
        if i != j {
            array.swapAt(i, j)
        }
    }
}
