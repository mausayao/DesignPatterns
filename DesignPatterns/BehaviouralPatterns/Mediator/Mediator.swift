//
//  Mediator.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 23/06/24.
//

import Foundation

class ChatUser {
    let name: String
    let mediator: Mediator
    
    init(name: String, mediator: Mediator) {
        self.name = name
        self.mediator = mediator
    }
    
    func sendMessage(message: String) {
        print("\(name): send message \(message)")
        mediator.sendMessage(message: message, source: self)
    }
    
    func receiveMessage(message: String) {
        print("\(name): receive message: \(message)")
    }
}

class Mediator {
    var users = [ChatUser]()
    
    func addUser(user: ChatUser) -> Mediator {
        users.append(user)
        return self
    }
    
    func sendMessage(message: String, source: ChatUser) {
        users.forEach({
            if $0 !== source {
                $0.receiveMessage(message: message)
            }
        })
    }
}

func mediatorClient() {
    print(#function)
    let mediator = Mediator()
    let alice = ChatUser(name: "Alice", mediator: mediator)
    let bob = ChatUser(name: "Bob", mediator: mediator)
    let carol = ChatUser(name: "Carol", mediator: mediator)
    
    mediator
        .addUser(user: alice)
        .addUser(user: bob)
        .addUser(user: carol)
    
    carol.sendMessage(message: "Hello everyone!")
}
