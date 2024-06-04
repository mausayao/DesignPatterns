//
//  Proxy.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 25/05/24.
//

import Foundation

protocol Image {
    func display()
}

class RealImage: Image {
    
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
        print("Real image: loading file \(fileName)")
    }
    
    func display() {
        print("Real image: displaying image \(fileName)")
    }
}

class ProxyImage: Image {
    
    let fileName: String
    let image: RealImage
    
    init(fileName: String) {
        self.fileName = fileName
        self.image = RealImage(fileName: fileName)
    }
    
    func display() {
        image.display()
        print("Proxy image: logging \(fileName)")
    }
}

func proxyClient() {
    print(#function)
    let image = ProxyImage(fileName: "test.png")
    
    image.display()
    print()
    image.display()
}
