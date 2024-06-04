//
//  Composite.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 22/05/24.
//

import Foundation

class Equipament {
    let name: String
    let price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func getPrice() -> Int {
        price
    }
}

class Composite: Equipament {
    var components: [Equipament] = []
    
    init(name: String) {
        super.init(name: name, price: 0)
    }
    
    func add(item: Equipament) {
        components.append(item)
    }
    
    override func getPrice() -> Int {
        return components.reduce(0) { $0 + $1.getPrice() }
    }
}

func compositeClient() {
    print(#function)
    let equipament = Composite(name: "PC")
    
    equipament.add(item: .init(name: "Video card", price: 1500))
    equipament.add(item: .init(name: "HDD", price: 400))
    
    let memory = Composite(name: "Memory")
    memory.add(item: .init(name: "RAM", price: 250))
    memory.add(item: .init(name: "ROM", price: 150))
    
    equipament.add(item: memory)
    
    print("total: ", equipament.getPrice())
}
