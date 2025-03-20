//
//  Validator.swift
//  calc
//
//  Created by Michael White on 15/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

struct Validator {
    static func isValidInteger(_ str: String) -> Bool {
        return Int(str) != nil
    }
    
    static func isValidOperator(_ str: String) -> Bool {
        return Operator(rawValue: str) != nil
    }
    
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
