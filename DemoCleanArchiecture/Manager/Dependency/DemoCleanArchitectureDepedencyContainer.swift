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
        let dependency: ImageTblDependencyContainerAbs = DIContainer.shared.getDepedency()
        let vc = dependency.makeImageTableViewController()
        return vc
    }
    
    func registerDepedency() {
        DIContainer.shared.register(type: RepositoryProviderAbs.self
                                    , service: RepositoryProvider())
        DIContainer.shared.register(type: UseCaseProviderAbs.self, service: UseCaseProvider())
        DIContainer.shared.register(type: ImageDetailDependencyContainerAbs.self, service: ImageDetailDependencyContainer())
        DIContainer.shared.register(type: ImageTblDependencyContainerAbs.self, service: ImageTblDependencyContainer())
    }
}
