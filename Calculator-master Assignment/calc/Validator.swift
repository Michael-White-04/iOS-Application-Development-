//
//  Validator.swift
//  calc
//
//  Created by Michael White on 15/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

struct Validator {
    
    // check if input can be converted to valid integer
    static func isValidInteger(_ str: String) -> Bool {
        return Int(str) != nil
    }
    
    // check if string is an operator we accept
    static func isValidOperator(_ str: String) -> Bool {
        return Operator(rawValue: str) != nil
    }
    
    // validate expression follows correct format
    static func isValidExpression(_ args: [String]) -> Bool {
        var expectNumber = true
        
        for arg in args {
            if expectNumber {
                if !isValidInteger(arg) {
                    return false
                }
            } else {
                if !isValidOperator(arg) {
                    return false
                }
            }
            expectNumber.toggle()
        }
        
        return !expectNumber
    }
    
    // check if expression contains any numbers outside the Int32 range
    static func hasOutOfBoundsNumber(_ args: [String]) -> Bool {
        for arg in args {
            if let num = Int(arg) {
                if num > Int32.max || num < Int32.min {
                    return true
                }
            }
        }
        return false
    }
}
