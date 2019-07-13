//
//  File.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Dip

protocol DipModule {
    
    static func register(in container: DependencyContainer)
}

extension DependencyContainer {
    
    func attach<Module: DipModule>(_ type: Module.Type) {
        type.register(in: self)
    }
}
