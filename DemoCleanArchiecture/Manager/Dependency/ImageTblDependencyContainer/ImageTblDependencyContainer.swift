//
//  ImageTblDependencyContainer.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import Foundation

protocol ImageTblDependencyContainerAbs {
    
    func makeImageTableViewController() -> ImageTableViewController
}

protocol ImageTblFactoryAbs {
    func makeImgDetailViewController(data: Data, name: String) -> ImageDetailViewController
}

class ImageTblDependencyContainer: ImageTblDependencyContainerAbs, ImageTblFactoryAbs {
    
    var imageTableVM: ImageTableVM
    
    init() {
        
        self.imageTableVM = makeImageTableVM()
        func makeImageTableVM() -> ImageTableVM {
            return ImageTableVM()
        }
    }
    
    func makeImageTableViewController() -> ImageTableViewController {
        let viewController = ImageTableViewController(vm: imageTableVM, factory: self)
        return viewController
    }
    
    func makeImgDetailViewController(data: Data, name: String) -> ImageDetailViewController {
        let imgDetailDepedency: ImageDetailDependencyContainerAbs = DIContainer.shared.getDepedency()
        return imgDetailDepedency.makeImageDetailViewController(data: data, name: name)
    }
}
