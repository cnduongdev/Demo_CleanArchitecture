//
//  Mapper.swift
//  DemoCleanArchiecture
//
//  Created by Apple on 04/03/2023.
//

import Foundation

protocol Mapper {
    
    associatedtype EM
    
    func map() -> EM
}
