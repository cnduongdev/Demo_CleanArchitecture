//
//  ImageRepository.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation
import Combine

protocol ImageRepositoryAbs {
        
    func downloadImage(operation: DownloadImageOperation, queue: OperationQueue) -> AnyPublisher<ImageDataEntity, Error>
}
