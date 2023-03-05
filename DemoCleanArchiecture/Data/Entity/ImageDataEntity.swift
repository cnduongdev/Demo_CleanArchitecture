//
//  ImageDataEntity.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import Foundation

class ImageDataEntity: Mapper {
    
    typealias EM = ImageDataModel
    
    var data: Data
    var name: String
    
    init(data: Data, name: String) {
        self.data = data
        self.name = name
    }
    
    func map() -> ImageDataModel {
        let model = ImageDataModel(data: data, name: name)
        return model
    }
}
