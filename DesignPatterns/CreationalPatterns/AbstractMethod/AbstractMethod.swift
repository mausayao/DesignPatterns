//
//  AbstractMethod.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 19/12/23.
//

import Foundation

protocol Service {
    func runServeice() -> String
}

protocol Response {
    func getResponse() -> String
}

protocol DataSourceAbstractFactory {
    func createService() -> Service
    func createResponse() -> Response
}

class DataBaseReponse: Response {
    func getResponse() -> String {
        "Database response"
    }
}

class DataBaseService: Service {
    func runServeice() -> String {
        "Database service running"
    }
}

class NetworkResponse: Response {
    func getResponse() -> String {
        "Network response"
    }
}

class NetworkService: Service {
    func runServeice() -> String {
        "Network service running"
    }
}

class DataBaseFacotry: DataSourceAbstractFactory {
    func createService() -> Service {
        DataBaseService()
    }
    
    func createResponse() -> Response {
        DataBaseReponse()
    }
}

class NetworkFactory: DataSourceAbstractFactory {
    func createService() -> Service {
        NetworkService()
    }
    
    func createResponse() -> Response {
        NetworkResponse()
    }
}

class Client {
    private let service: Service
    private let response: Response
    
    init(factory: DataSourceAbstractFactory) {
        self.service = factory.createService()
        self.response = factory.createResponse()
    }
    
    func commmunicate() {
        print(service.runServeice())
        print(response.getResponse())
    }
}

func abstractFactoryClient() {
    print(#function)
    let client1 = Client(factory: DataBaseFacotry())
    client1.commmunicate()
    
    let client2 = Client(factory: NetworkFactory())
    client2.commmunicate()
}
