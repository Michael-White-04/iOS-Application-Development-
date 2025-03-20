//
//  Operator.swift
//  calc
//
//  Created by Michael White on 21/3/2025.
//  Copyright © 2025 UTS. All rights reserved.
//

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "/"
    case modulus = "%"
    
    var isHighPrecedence: Bool {
        return self == Operator.multiply || self == Operator.divide || self == Operator.modulus
    }
}
