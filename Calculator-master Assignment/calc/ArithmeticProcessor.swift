//
//  ArithmeticProcessor.swift
//  calc
//
//  Created by Michael White on 21/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

class ArithmeticProcessor {
    func perform(op: Operator, no1: Int, no2: Int) throws -> Int {
        switch op {
            case Operator.add:
                return try add(no1, no2)
            
            case Operator.subtract:
                return try subtract(no1, no2)
            
            case Operator.multiply:
                return try multiply(no1, no2)
            
            case Operator.divide:
                return try divide(no1, no2)
            
            case Operator.modulus:
                return try modulus(no1, no2)
        }
    }
    
    func add(_ no1: Int, _ no2: Int) throws -> Int {
        let result = no1 &+ no2 // check what the result is
        
        // if this condition is true, then the bounds have been reached and result has wrapped around
        if (result < Int32.min) || (result > Int32.max) {
            throw CalculatorError.overflow
        }
        return result    }
    
    func subtract(_ no1: Int, _ no2: Int) throws -> Int {
        let result = no1 &- no2 // check what the result is
        
        // if this condition is true, then the bounds have been reached and result has wrapped around
        if (result < Int32.min) || (result > Int32.max) {
            throw CalculatorError.overflow
        }
        return result
    }
    
    func multiply(_ no1: Int, _ no2: Int) throws -> Int {
        /*if no1 != 0 && no2 != 0 {
            let result = no1 &* no2
            if result / no1 != no2 {
                print("Error: Integer overflow")
                exit(1)
            }
            return result
        }
        return 0; */
        no1 * no2 // overflow is automatically handled here by swift
    }
    
    func divide(_ no1: Int, _ no2: Int) throws -> Int {
        if no2 == 0 {
            throw CalculatorError.divisionByZero
        }
        return no1 / no2;
    }
    
    func modulus(_ no1: Int, _ no2: Int) throws -> Int {
        if no2 == 0 {
            throw CalculatorError.modulusByZero
        }
        return no1 % no2;
    }}
