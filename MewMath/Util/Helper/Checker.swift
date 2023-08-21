//
//  Checker.swift
//  MewMath
//
//  Created by Agung Saputra on 21/08/23.
//

import Foundation

func checkItemOnTarget(position: [CGFloat], screenWidth: CGFloat, screenHeight: CGFloat) -> Bool {
    let xOver = abs(screenWidth * 1/2 - position[0])
    let yOver = abs(screenHeight * 4/9 - 25 - position[1])
    return (xOver < 130 && yOver < 54)
}

func countItemOnTarget(_ arr: [Bool]) -> Int {
    return arr.reduce(0) {
        $1 ? $0 + 1 : $0
    }
}
