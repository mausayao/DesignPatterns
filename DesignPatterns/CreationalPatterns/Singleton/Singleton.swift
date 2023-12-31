//
//  Singleton.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 16/11/23.
//

import Foundation

struct API {
    static var url = URL(string: "google.com")
}

class NetworkDriver {
    
    let baseUrl: URL?
    static let shared = NetworkDriver(baseUrl: API.url)
    
    private init(baseUrl: URL?) {
        self.baseUrl = baseUrl
    }
}

func singletonClient() {
    print(#function)
    print(NetworkDriver.shared.baseUrl?.absoluteString ?? "")
}
