//
//  ImageTableVM.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation
import Combine

protocol ImageTableVMAbs {
    
    func readImageUrls()
    
    func executeDownloadImage(indexPath: IndexPath, completion: @escaping ((Data?) -> Void ))
    
    func cancelOperation(indexPath: IndexPath)
    
    func removeExistOpration(indexPath: IndexPath)
    
    func getNumberOfDataSource() -> Int
}

class ImageTableVM: ImageTableVMAbs {
    
    struct Input {
        let useCaseProvider: UseCaseProviderAbs = DIContainer.shared.getDepedency()
    }
    
    var urls: [String] = []
    let input = Input()
    let operationQueue = OperationQueue()
    var operationIndexPath: [IndexPath: Operation] = [:]
    var set = Set<AnyCancellable>()
    
    init() {
        readImageUrls()
    }
    
    func readImageUrls() {
        guard let url = Bundle.main.url(forResource: "Photos", withExtension: ".plist"),
              let data = try? Data(contentsOf: url),
              let list = try? PropertyListSerialization.propertyList(from: data, format: nil),
              let serialUrls = list as? [String] else { return }
        self.urls = serialUrls.compactMap({ $0 })
    }
    
    func executeDownloadImage(indexPath: IndexPath, completion: @escaping ((Data?) -> Void )) {
        let downloadImageUseCase = input.useCaseProvider.makeDownloadImageUseCase()
        let operation = DownloadImageOperation(url: urls[indexPath.row])
        operationIndexPath[indexPath] = operation
        
        downloadImageUseCase.execute(params: DownloadImageParams(operation: operation, queue: operationQueue))
            .sink(receiveCompletion: { [weak self] error in
                print(error)
                guard let `self` = self else { return }
                completion(nil)
            }, receiveValue: { [weak self] value in
                guard let `self` = self else { return }
                completion(value)
            }).store(in: &set)
        
    }
    
    func cancelOperation(indexPath: IndexPath) {
        if let operation = operationIndexPath[indexPath] {
            operation.cancel()
        }
    }
    
    func removeExistOpration(indexPath: IndexPath) {
        if let operation = operationIndexPath[indexPath] {
            operation.cancel()
        }
    }
    
    func getNumberOfDataSource() -> Int {
        return urls.count
    }
}
