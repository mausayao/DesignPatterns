//
//  Adapter.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 13/05/24.
//

import Foundation

class DisplayData3rdParty {
    let index: Double
    let data: String
    
    init(index: Double, data: String) {
        self.index = index
        self.data = data
    }
    
    func displayData() {
        print("Data display \(index) - \(data)")
    }
}

class DataBaseData {
    let position: Int
    let amount: Int
    
    init(position: Int, amount: Int) {
        self.position = position
        self.amount = amount
    }
}

struct DataBaseGenerator {
    static func generateData() -> [DataBaseData] {
        var arr = [DataBaseData]()
        
        for _ in 1...10 {
            arr.append(.init(position: Int.random(in: 1...100), amount: Int.random(in: 1...100)))
        }
        
        return arr
    }
}

protocol DataConverte {
    func converteData(data: [DataBaseData]) -> [DisplayData3rdParty]
}

class Adapter: DataConverte {
    func converteData(data: [DataBaseData]) -> [DisplayData3rdParty] {
        data.map { data in
            DisplayData3rdParty(index: Double(data.position), data: String(data.amount))
        }
    }
}

func adapterClient() {
    print(#function)
    let dataGenerated = DataBaseGenerator.generateData()
    let adapter = Adapter()
    
    let legacyData = adapter.converteData(data: dataGenerated)
    
    legacyData.forEach { item in
        item.displayData()
    }
}
