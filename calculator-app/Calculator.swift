//
//  Calculator.swift
//  calculator-app
//
//  Created by ShahJee on 27/10/2023.
//

import Foundation

class Calculator {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod:String)?
    
    func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                number = 0
                intermediateCalculation = nil
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performCalculation(with: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return number
    }
    
    func performCalculation(with n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "/":
                return n1 / n2
            case "x":
                return n1 * n2
            default:
                fatalError("Unrecognized operation.")
            }
        }
        
        return nil
    }
}

