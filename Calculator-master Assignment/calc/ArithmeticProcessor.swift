//
//  ArithmeticProcessor.swift
//  calc
//
//  Created by Michael White on 21/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

class ArithmeticProcessor {
    
    // performs specific operation on two integers
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
    
    private func checkOverflow(_ result: Int) throws -> Int {
        if (result < Int32.min) || (result > Int32.max) {
            throw CalculatorError.overflow
        }
        return result
    }
    
    // add two integers and check for overflow
    private func add(_ no1: Int, _ no2: Int) throws -> Int {
        let result = no1 &+ no2 // see what the result is
        return try checkOverflow(result)
    }
    
    // subtracts two integers while checking for overflow
    private func subtract(_ no1: Int, _ no2: Int) throws -> Int {
        let result = no1 &- no2 // see what the result is
        return try checkOverflow(result)
    }
    
    // multiplies two integers while checking for overflow
    private func multiply(_ no1: Int, _ no2: Int) throws -> Int {
        let result = no1 &* no2 // see what the result is
        return try checkOverflow(result)
    }
    
    // divides two integers and check for division by zero
    private func divide(_ no1: Int, _ no2: Int) throws -> Int {
        if no2 == 0 {
            throw CalculatorError.divisionByZero
        }
        return no1 / no2;
    }
    
    // calculates the modulus of two integers and checks for modulus by zero
    private func modulus(_ no1: Int, _ no2: Int) throws -> Int {
        if no2 == 0 {
            throw CalculatorError.modulusByZero
        }
        return no1 % no2;
    }}
