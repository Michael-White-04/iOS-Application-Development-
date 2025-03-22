//
//  ExpressionEvaluator.swift
//  calc
//
//  Created by Michael White on 21/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

class ExpressionEvaluator {
    let processor = ArithmeticProcessor()
    
    // evaulates mathematical expression and handles operator precedence
    func evaluate(args: [String]) throws -> String {
        var numbers = [Int]()
        var operators = [Operator]()
        
        // separate input by numbers and operators
        for arg in args {
            if let num = Int(arg) {
                numbers.append(num)
            } else if let op = Operator(rawValue: arg){
                operators.append(op)
            } else {
                throw CalculatorError.invalidExpression
            }
        }
        
        // handling multiplication and division first
        var newNumbers = [numbers[0]]
        var newOperators = [Operator]()
        
        for i in 0..<operators.count {
            let op = operators[i]
            let nextNum = numbers[i + 1]
            
            if op.isHighPrecedence {
                let lastNum = newNumbers.removeLast()
                let result = try processor.perform(op: op, no1: lastNum, no2: nextNum)
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
            result = try processor.perform(op: op, no1: result, no2: num)
        }
        
        return String(result)
    }}
