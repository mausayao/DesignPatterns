//
//  Bridge.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 14/05/24.
//

import Foundation

protocol PhoneOS {
    func upload(data: String)
    func download(data: String)
    func display(data: String)
}

class iOS: PhoneOS {
    func upload(data: String) {
        print("iOS upload data \(data)")
    }
    
    func download(data: String) {
        print("iOS download data \(data)")
    }
    
    func display(data: String) {
        print("iOS display data \(data)")
    }
}

class Android: PhoneOS {
    func upload(data: String) {
        print("Android upload data \(data)")
    }
    
    func download(data: String) {
        print("Android download data \(data)")
    }
    
    func display(data: String) {
        print("Android display data \(data)")
    }
}

protocol PhoneApp {
    func runApp()
}

class Facebook: PhoneApp {
    let os: PhoneOS
    
    init(os: PhoneOS) {
        self.os = os
    }
    
    func runApp() {
        os.upload(data: "facebook upload data")
        os.download(data: "facebook download data")
        os.display(data: "facebook data")
    }
}

class Instagram: PhoneApp {
    let os: PhoneOS
    
    init(os: PhoneOS) {
        self.os = os
    }
    
    func runApp() {
        os.upload(data: "Instagram upload data")
        os.download(data: "Instagram download data")
        os.display(data: "Instagram data")
    }
}

func bridgeClient() {
    print(#function)
    let app1 = Facebook(os: iOS())
    let app2 = Instagram(os: Android())
    
    app1.runApp()
    app2.runApp()
}
