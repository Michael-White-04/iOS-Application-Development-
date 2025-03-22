//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

do {
    // check expression format and for out of bounds numbers
    if !Validator.isValidExpression(args) || Validator.hasOutOfBoundsNumber(args) {
        throw CalculatorError.invalidExpression
    }
    
    // initialise calculator and evaluate expression
    let calculator = Calculator();
    let result = try calculator.calculate(args)
    
    print(result)
} catch let error as CalculatorError {
    // handle known calculator errors and display appropriate message
    print("Error:", error.localizedDescription)
    exit(1)
} catch {
    // handle any other unexpected errors
    print("Unexpected error:", error)
    exit(1)
}
