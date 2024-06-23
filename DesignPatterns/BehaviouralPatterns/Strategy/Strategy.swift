//
//  Strategy.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 18/06/24.
//

import Foundation

protocol PrintStrategy {
    func formatString(input: String) -> String
}

class Executor {
    var strategy: PrintStrategy
    
    init(strategy: PrintStrategy) {
        self.strategy = strategy
    }
    
    func printString(input: String) {
        print(strategy.formatString(input: input))
    }
}

class LowerCaseStrategy: PrintStrategy {
    func formatString(input: String) -> String {
        input.lowercased()
    }
}

class UpperCaseStrategy: PrintStrategy {
    func formatString(input: String) -> String {
        input.uppercased()
    }
}

class RandomCaseStrategy: PrintStrategy {
    func formatString(input: String) -> String {
        var output = ""
        input.forEach { char in
            if Bool.random() {
                output += char.uppercased()
            } else {
                output += char.lowercased()
            }
        }
        return output
    }
}

func strategyClient() {
    print(#function)
    let input = "LOREM ipsum DOLOR sit AMET"
    
    let str1 = LowerCaseStrategy()
    let str2 = UpperCaseStrategy()
    let str3 = RandomCaseStrategy()
    
    let executor = Executor(strategy: str1)
    executor.printString(input: input)
    
    executor.strategy = str2
    executor.printString(input: input)
    
    executor.strategy = str3
    executor.printString(input: input)
}
