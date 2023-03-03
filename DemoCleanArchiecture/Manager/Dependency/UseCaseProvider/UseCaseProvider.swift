//
//  UseCaseProvider.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation

class UseCaseProvider: UseCaseProviderAbs {
    
    var imageRepository: ImageRepositoryAbs
    
    init() {
        let repsitoryProvider: RepositoryProviderAbs = DIContainer.shared.getDepedency()
        self.imageRepository = repsitoryProvider.makeImageRepository()
    }
    
    func makeDownloadImageUseCase() -> DownloadImageUseCase {
        return DownloadImageUseCase(repository: imageRepository)
    }
}
