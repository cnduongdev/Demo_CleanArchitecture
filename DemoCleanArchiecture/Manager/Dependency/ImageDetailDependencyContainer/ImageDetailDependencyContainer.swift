//
//  ImageDetailDependencyContainer.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import Foundation

protocol ImageDetailDependencyContainerAbs {
    
    func makeImageDetailDependencyVM(data: Data, name: String) -> ImageDetailVMAbs
    
    func makeImageDetailViewController(data: Data, name: String) -> ImageDetailViewController
}

class ImageDetailDependencyContainer: ImageDetailDependencyContainerAbs {
    
    func makeImageDetailDependencyVM(data: Data, name: String) -> ImageDetailVMAbs {
        return ImageDetailVM(imageData: data, name: name)
    }
    
    func makeImageDetailViewController(data: Data, name: String) -> ImageDetailViewController {
        let vm = makeImageDetailDependencyVM(data: data, name: name)
        return ImageDetailViewController(vm: vm)
    }
}
