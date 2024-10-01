//
//  EvenNumbers.swift
//  walmart cashi
//
//  Created by Pedro Romero on 01/10/24.
//

import Foundation

struct EvenNumbers {
    static func sumOfEvenNumbers(_ numbers: [Int]) -> Int {
        var sum = 0
        numbers.forEach { number in
            if number % 2 == 0 {
                sum += number
            }
        }
        return sum
    }
}
