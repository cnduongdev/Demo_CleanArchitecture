//
//  UseCase.swift
//  DemoCleanArchiecture
//
//  Created by Cao Nam Duong on 03/03/2023.
//

import Foundation

protocol UseCase {
    associatedtype PM
    associatedtype EM
    
    func execute(params: PM) -> EM
}
