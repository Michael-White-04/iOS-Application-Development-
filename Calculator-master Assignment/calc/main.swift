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

//var args = ["2147483607", "+", "102"]

do {
    if !Validator.isValidExpression(args) || Validator.hasOutOfBoundsNumber(args) {
        throw CalculatorError.invalidExpression
    }
    
    let calculator = Calculator();
    let result = try calculator.calculate(args)
    print(result)
} catch let error as CalculatorError {
    print("Error:", error.localizedDescription)
    exit(1)
} catch {
    print("Unexpected error:", error)
    exit(1)
}
