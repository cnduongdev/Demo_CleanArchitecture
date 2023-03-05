//
//  ImageDataModel.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import Foundation

class ImageDataModel {
    
    var data: Data
    var name: String
    
    init(data: Data, name: String) {
        self.data = data
        self.name = name
    }
}
