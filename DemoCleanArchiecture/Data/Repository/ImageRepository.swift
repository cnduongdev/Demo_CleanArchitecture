//
//  Repository.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation
import Combine

class ImageRepository: ImageRepositoryAbs {
    
    func downloadImage(operation: DownloadImageOperation, queue: OperationQueue) -> AnyPublisher<Data, Error> {
        
        let subject = PassthroughSubject<Data, Error>()

        operation.completion = { state in
            switch state {
            case .success(let data):
                subject.send(data)
                print(data)
            case .failure(let error):
                subject.send(completion: .failure(error))
            }
        }
        queue.addOperation(operation)
        return subject.eraseToAnyPublisher()
        
    }
}
