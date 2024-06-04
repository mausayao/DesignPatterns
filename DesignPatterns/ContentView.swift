//
//  ContentView.swift
//  DesignPatterns
//
//  Created by Maurício Sayão on 16/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            main()
        } label: {
            Text("Run Pattern")
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

func main() {
    singletonClient()
    print("-----------------------")
    factoryMethodClient()
    print("-----------------------")
    abstractFactoryClient()
    print("-----------------------")
    builderClient()
    print("-----------------------")
    prototypeClient()
    print("---Structural Patterns---")
    adapterClient()
    print("-----------------------")
    bridgeClient()
    print("-----------------------")
    facadeClient()
    print("-----------------------")
    decoratorClient()
    print("-----------------------")
    compositeClient()
    print("-----------------------")
    proxyClient()
    print("-----------------------")
    flyweightClient()
    print("---Behavioural Patterns---")
    observerClient()
    print("-----------------------")
    chainOfResponsibilityClient()
    print("-----------------------")
    commandClient()
}
