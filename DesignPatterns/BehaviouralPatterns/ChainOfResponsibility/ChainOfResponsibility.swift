//
//  ChainOfResponsibility.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 30/05/24.
//

import Foundation

protocol HandleChain {
    func addHandler(inputHeader: String) -> String
}

class AuthenticationHandler: HandleChain {
    let token: String
    let next: HandleChain?
    
    init(token: String, next: HandleChain? = nil) {
        self.token = token
        self.next = next
    }
    
    func addHandler(inputHeader: String) -> String {
        let outputHeader = "\(inputHeader) \nAuthenticatiion: \(token)"
        
        guard let next = self.next else { return  outputHeader }
        return next.addHandler(inputHeader: outputHeader)
    }
}

class ContentTypeHandler: HandleChain {
    let contentType: String
    let next: HandleChain?
    
    init(contentType: String, next: HandleChain? = nil) {
        self.contentType = contentType
        self.next = next
    }
    
    func addHandler(inputHeader: String) -> String {
        let outputHeader = "\(inputHeader) \nContentType \(contentType)"
        
        guard let next = self.next else { return  outputHeader }
        return next.addHandler(inputHeader: outputHeader)
    }
}

class PayloadHandler: HandleChain {
    let payload: String
    let next: HandleChain?
    
    init(payload: String, next: HandleChain? = nil) {
        self.payload = payload
        self.next = next
    }
    
    func addHandler(inputHeader: String) -> String {
        let outputHeader = "\(inputHeader) \nPayload \(payload)"
        
        guard let next = self.next else { return  outputHeader }
        return next.addHandler(inputHeader: outputHeader)
    }
}

func chainOfResponsibilityClient() {
    print(#function)
    let payload = PayloadHandler(payload: "Body: {\"username\": \"john\"}")
    let type = ContentTypeHandler(contentType: "json", next: payload)
    let auth = AuthenticationHandler(token: "12345", next: type)
    
    let withAuthentication = auth.addHandler(inputHeader: "### Headers with authentication")
    print(withAuthentication)
    
    let withoutAuthentication = type.addHandler(inputHeader: "### Headers without authentication")
    print(withoutAuthentication)
}
