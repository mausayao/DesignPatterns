//
//  Decorator.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 22/05/24.
//

import Foundation

protocol CoffeeMachine {
    func makeSmallCoffee()
    func makeLargeCoffee()
}

class BasicCoffeeMachine: CoffeeMachine {
    func makeSmallCoffee() {
        print("Coffee machine: making small coffee")
    }
    
    func makeLargeCoffee() {
        print("Coffee machine: make large coffee")
    }
}

class EnhancedCoffeeMachine: BasicCoffeeMachine {
    let machine: BasicCoffeeMachine
    
    init(machine: BasicCoffeeMachine) {
        self.machine = machine
    }
    
    override func makeSmallCoffee() {
        print("Enhanced coffer make small coffee")
    }
    
    override func makeLargeCoffee() {
        machine.makeLargeCoffee()
    }
    
    func makeMilkCoffee() {
        print("Enhanced machine make milk coffee")
        machine.makeLargeCoffee()
        print("addding milk")
    }
}

func decoratorClient() {
    print(#function)
    let basicMachine = BasicCoffeeMachine()
    let enhancedMachine = EnhancedCoffeeMachine(machine: basicMachine)
    
    basicMachine.makeSmallCoffee()
    basicMachine.makeSmallCoffee()
    
    enhancedMachine.makeSmallCoffee()
    enhancedMachine.makeLargeCoffee()
    enhancedMachine.makeMilkCoffee()
}
