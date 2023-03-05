//
//  DownloadImageUseCase.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation
import Combine

class DownloadImageUseCase: UseCase {
    
    typealias PM = DownloadImageParams
    typealias EM = AnyPublisher<ImageDataEntity, Error>
    
    private let repository: ImageRepositoryAbs
    
    init(repository: ImageRepositoryAbs) {
        self.repository = repository
    }
    
    func execute(params: DownloadImageParams) -> AnyPublisher<ImageDataEntity, Error> {
        return repository.downloadImage(operation: params.operation, queue: params.operationQueue)
    }
}

class DownloadImageParams {
    
    var operationQueue: OperationQueue
    var operation: DownloadImageOperation
    
    init(operation: DownloadImageOperation, queue: OperationQueue) {
        self.operation = operation
        self.operationQueue = queue
    }
}
