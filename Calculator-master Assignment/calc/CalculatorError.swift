//
//  CalculatorError.swift
//  calc
//
//  Created by Michael White on 20/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

enum CalculatorError: Error {
    case invalidExpression
    case overflow
    case divisionByZero
    case modulusByZero
    
    var localisedDescription: String {
        switch self {
        case CalculatorError.invalidExpression:
            return "Invalid expression"
        case CalculatorError.overflow:
            return "Integer overflow"
        case CalculatorError.divisionByZero:
            return "Error: Division by zero"
        case CalculatorError.modulusByZero:
            return "Error: Modulus by zero"
        }
    }
}
