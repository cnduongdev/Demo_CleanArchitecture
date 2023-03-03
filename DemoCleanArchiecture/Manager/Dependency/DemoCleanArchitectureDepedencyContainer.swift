//
//  DemoCleanArchitectureDepedencyContainer.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation
import UIKit

class DemoCleanArchitectureDepedencyContainer {
    
    init() {
        registerDepedency()
    }
    
    func makeRootViewController() -> UIViewController {
        let vc = ImageTableViewController(vm: makeImageTableVM())
        
        func makeImageTableVM() -> some ImageTableVMAbs {
            return ImageTableVM()
        }
        return vc
    }
    
    func registerDepedency() {
        DIContainer.shared.register(type: RepositoryProviderAbs.self
                                    , service: RepositoryProvider())
        DIContainer.shared.register(type: UseCaseProviderAbs.self, service: UseCaseProvider())
   
    }
}
