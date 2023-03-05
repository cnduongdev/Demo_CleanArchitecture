//
//  DownloadImageOperation.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation
import Combine

enum DownloadImageState {
    case success(data: Data, name: String)
    case failure(error: Error)
}

class DownloadImageOperation: AsyncOperation {
    
    var url: String
    
    var task: URLSessionDataTask?
    var completion: ((DownloadImageState) -> Void)?
    
    init(url: String) {
        self.url = url
    }
    
    override func main() {
        guard !isCancelled else { return }
        guard let imgURL = URL(string: url) else { return }
        
        
        task = URLSession.shared.dataTask(with: imgURL) { data, response, error in
            defer { self.state = .finished }
            if let err = error {
                self.completion?(.failure(error: err))
                return
            }
            guard let imgData = data else { return }
            self.completion?(.success(data: imgData, name: imgURL.lastPathComponent))
        }
        
        task?.resume()
    }
    
    override func cancel() {
        super.cancel()
        task?.cancel()
    }
}
