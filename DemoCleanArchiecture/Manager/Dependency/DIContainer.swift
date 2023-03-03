//
//  DIContainer.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation

class DIContainer {
    
    static let shared = DIContainer()
    var depedenciesContainer: [String: Any] = [:]
    
    func register<T>(type: T.Type, service: T) {
        let key = String(describing: type)
        depedenciesContainer[key] = service
    }
    
    func getDepedency<T>() -> T {
        let key = String(describing: T.self)
        return depedenciesContainer[key] as! T
    }
}
