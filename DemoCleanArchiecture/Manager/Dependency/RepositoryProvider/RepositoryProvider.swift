//
//  RepositoryProvider.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation

class RepositoryProvider: RepositoryProviderAbs {
    
    func makeImageRepository() -> ImageRepositoryAbs {
        return ImageRepository()
    }
}
