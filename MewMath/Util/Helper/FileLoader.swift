//
//  JsonLoader.swift
//  MewMath
//
//  Created by Agung Saputra on 21/08/23.
//

import Foundation

func loadJson<T: Decodable>(_ filename: String) throws -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        throw NSError(
            domain: NSCocoaErrorDomain,
            code: NSFileReadNoSuchFileError,
            userInfo: [NSLocalizedDescriptionKey: "Couldn't find \(filename) in main module."]
        )
    }
    
    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        throw NSError(
            domain: NSCocoaErrorDomain,
            code: NSFileReadUnknownError,
            userInfo: [NSLocalizedDescriptionKey: "Couldn't load \(filename) from main bundle:\n\(error)"]
        )
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        throw NSError(
            domain: NSCocoaErrorDomain,
            code: NSFileReadCorruptFileError,
            userInfo: [NSLocalizedDescriptionKey: "Couldn't parse \(filename) as \(T.self):\n\(error)"]
        )
    }
}
