//
//  Flyweight.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 25/05/24.
//

import Foundation

protocol Sprite {
    func draw()
    func move(x: Int, y: Int)
}

enum FIghterRank: CaseIterable {
    case PRIVATE, SEARGENT, MAJOR
    
    static func randonFighter() -> FIghterRank {
        allCases.randomElement()!
    }
}

class Fighter: Sprite {
    let rank: FIghterRank
    
    init(rank: FIghterRank) {
        self.rank = rank
    }
    
    func draw() {
        print("Draw a fighter")
    }
    
    func move(x: Int, y: Int) {
        print("Moviing a fighter to position \(x) and \(y)")
    }
    
}

class FighterFactory {
    static var fighters = [FIghterRank: Fighter]()
    
    static func getFighter(rank: FIghterRank) -> Fighter {
        if !fighters.keys.contains(rank) {
            fighters[rank] = Fighter(rank: rank)
        }
        
        return fighters[rank]!
    }
}

class Army {
    var fighters = [Fighter]()
    
    func spawsFighter(rank: FIghterRank) {
        let fighter = FighterFactory.getFighter(rank: rank)
        fighters.append(fighter)
    }
    
    func drawArmy() {
        fighters.forEach {
            switch $0.rank {
            case .PRIVATE:
                print("P ", terminator: "")
            case .SEARGENT:
                print("S ", terminator: "")
            case .MAJOR:
                print("M ", terminator: "")
            }
        }
        print()
    }
}

func flyweightClient() {
    let armSize = 1000
    let army = Army()
    (1...armSize).forEach { _ in
        army.spawsFighter(rank: .randonFighter())
    }
    
    army.drawArmy()
}
