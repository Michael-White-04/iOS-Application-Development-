//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    let evaluator = ExpressionEvaluator()
    
    func calculate(_ args: [String]) throws -> String {
        return try evaluator.evaluate(args: args)
    }
}
