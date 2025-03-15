//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    var currentResult = 0;

    func add(no1: Int, no2: Int) -> Int {
        let result = no1 &+ no2 // check what the result is
        // if this condition is true, then the bounds have been reached and result has wrapped around
        if (result < Int32.min) || (result > Int32.max) {
            print("Error: Integer overflow (addition)")
            exit(1)
        }
        return no1 + no2
    }
    
    func subtract(no1: Int, no2: Int) -> Int {
        let result = no1 &- no2 // check what the result is
        
        // if this condition is true, then the bounds have been reached and result has wrapped around
        if (result < Int32.min) || (result > Int32.max) {
            print("Error: Integer overflow (subtraction)")
            exit(1)
        }
        return no1 - no2
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        /*if no1 != 0 && no2 != 0 {
            let result = no1 &* no2
            if result / no1 != no2 {
                print("Error: Integer overflow")
                exit(1)
            }
            return result
        }
        return 0; */
        no1 * no2
    }
    
    func divide(no1: Int, no2: Int) -> Int {
        if no2 == 0 {
            print("Error: Division by zero")
            exit(1)
        }
        return no1 / no2;
    }
    
    func modulus(no1: Int, no2: Int) -> Int {
        if no2 == 0 {
            print("Error: Modulus by zero")
            exit(1)
        }
        return no1 % no2;
    }
    
    func calculate(args: [String]) -> String {
        var numbers = [Int]()
        var operators = [String]()
        
        for arg in args {
            if let num = Int(arg) {
                numbers.append(num)
            } else {
                operators.append(arg)
            }
        }
        
        // handling multiplication and division first
        var newNumbers = [numbers[0]]
        var newOperators = [String]()
        
        for i in 0..<operators.count {
            let op = operators[i]
            let nextNum = numbers[i + 1]
            
            if op == "x" || op == "/" || op == "%" {
                let lastNum = newNumbers.removeLast()
                let result: Int
                if op == "x" {
                    result = multiply(no1: lastNum, no2: nextNum)
                } else if op == "/" {
                    result = divide(no1: lastNum, no2: nextNum)
                } else {
                    result = modulus(no1: lastNum, no2: nextNum)
                }
                newNumbers.append(result)
            } else {
                newNumbers.append(nextNum)
                newOperators.append(op)
            }
        }
        
        // handling addition and subtraction after
        var result = newNumbers[0]
        for i in 0..<newOperators.count {
            let op = newOperators[i]
            let num = newNumbers[i + 1]
            if op == "+" {
                result = add(no1: result, no2: num)
            } else {
                result = subtract(no1: result, no2: num)
            }
        }
        
        return String(result)
    }
}
