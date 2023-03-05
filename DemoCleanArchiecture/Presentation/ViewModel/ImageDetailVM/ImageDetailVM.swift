//
//  ImageDetailVM.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import Foundation

protocol ImageDetailVMAbs {
    
    func getImageData() -> Data
    
    func getImageName() -> String
    
    func getImageSize() -> Int
}

class ImageDetailVM: ImageDetailVMAbs {
    
    private var imageData: Data
    private var name: String
    
    init(imageData: Data, name: String) {
        self.imageData = imageData
        self.name = name
    }
    
    func getImageData() -> Data {
        return imageData
    }
    
    func getImageName() -> String {
        return name
    }
    
    func getImageSize() -> Int {
        return 0
    }
}
