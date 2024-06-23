//
//  Memento.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 23/06/24.
//

import Foundation

class Memento {
    let state: String
    
    init(state: String) {
        self.state = state
    }
}

class Originator {
    var state: String
    
    init(state: String) {
        self.state = state
    }
    
    func createMemento() -> Memento {
        Memento(state: state)
    }
    
    func restoreMemento(memento: Memento?) {
        guard let memento = memento else { return }
        state = memento.state
    }
    
    func printState() {
        print("current state: \(state)")
    }
}

class Caretaker {
    
    private var mementoList = [Memento]()
    
    func saveState(state: Memento) {
        mementoList.append(state)
    }
    
    func restoreState(index: Int) -> Memento? {
        if index <= mementoList.count {
          return mementoList[index]
        }
        
        return nil
    }
}

func mementoClient() {
    print(#function)
    let originator = Originator(state: "Initial state")
    let caretaker = Caretaker()
    
    caretaker.saveState(state: originator.createMemento())
    originator.printState()
    
    originator.state = "State 1"
    caretaker.saveState(state: originator.createMemento())
    originator.printState()
    
    originator.state = "State 2"
    caretaker.saveState(state: originator.createMemento())
    originator.printState()
    
    originator.restoreMemento(memento: caretaker.restoreState(index: 1))
    originator.printState()
    
    originator.restoreMemento(memento: caretaker.restoreState(index: 0))
    originator.printState()
    
    originator.restoreMemento(memento: caretaker.restoreState(index: 2))
    originator.printState()
}
