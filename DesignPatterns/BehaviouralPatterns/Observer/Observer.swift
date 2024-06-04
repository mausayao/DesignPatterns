//
//  Observer.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 28/05/24.
//

import Foundation

enum EventType: CaseIterable {
    case open, save
}

protocol EventListener: AnyObject {
    func notify(eventType: EventType, file: String)
}

final class EventManager {
    private var listeners: [EventType: [EventListener]] = [:]
    
    init(operations: [EventType]) {
        operations.forEach { op in
            listeners[op] = []
        }
    }
    
    convenience init() {
        self.init(operations: EventType.allCases)
    }
    
    func subscribe(event: EventType, listener: EventListener) {
        let users = listeners[event]
        guard let users = users else { return }
        
        if !users.contains(where: { l in
            l === listener
        }) {
            listeners[event]?.append(listener)
        }
    }
    
    func unsubscribe(event: EventType, listener: EventListener) {
        let users = listeners[event]
        
        guard let users = users else { return }
        
        if users.contains(where: { l in
            l === listener
        }) {
            listeners[event]?.removeAll(where: { l in
                l === listener
            })
        }
    }
    
    func notify(event: EventType, file: String) {
        let users = listeners[event]
        guard let users = users else { return }
        
        users.forEach { $0.notify(eventType: event, file: file) }
    }
}

class Editor {
    let events = EventManager()
    var file = ""
    
    func openFile(fileName: String) {
        file = fileName
        events.notify(event: .open, file: file)
    }
    
    func saveFile() {
        if !file.isEmpty {
            events.notify(event: .save, file: file)
        }
    }
}

class EmailNotificationListener: EventListener {
    func notify(eventType: EventType, file: String) {
        print("EmailNotificationListener \(eventType) performe on file \(file)")
    }
}

class LogOpenListener: EventListener {
    func notify(eventType: EventType, file: String) {
        print("LogOpenListener \(eventType) performe on file \(file)")
    }
}

func observerClient() {
    print(#function)
    let editor = Editor()
    let emailListener = EmailNotificationListener()
    let logListener = LogOpenListener()
    
    editor.events.subscribe(event: .open, listener: emailListener)
    editor.events.subscribe(event: .save, listener: emailListener)
    editor.events.subscribe(event: .open, listener: logListener)
    
    editor.openFile(fileName: "test.jpg")
    editor.saveFile()
}
