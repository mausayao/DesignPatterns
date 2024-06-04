//
//  Facade.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 20/05/24.
//

import Foundation

class Comm {
    func sendData(data: String) {
        print("sending data \(data)")
    }
    
    func receive() {
        print("receive response")
    }
}

class Cache {
    func cache() {
        print("Checking cache for outdated data")
    }
}

class Interceptor {
    func interept() {
        print("logging any response or error message")
    }
}

class Converter {
    func convert() {
        print("Convert any class to json")
    }
}

class NetworkAccessFacade {
    private let comm = Comm()
    private let cache = Cache()
    private let interceptor = Interceptor()
    private let converter = Converter()
    
    func communicate() {
        cache.cache()
        interceptor.interept()
        comm.sendData(data: "send data")
        comm.receive()
        converter.convert()
    }
}

func facadeClient() {
    print(#function)
    let facade = NetworkAccessFacade()
    
    facade.communicate()
}
