//
//  UseCaseProviderAbs.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation

protocol UseCaseProviderAbs {
    
    func makeDownloadImageUseCase() -> DownloadImageUseCase
}
