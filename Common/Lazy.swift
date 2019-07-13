//
//  Lazy.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation

class Lazy<Type, Parameters> {
    
    typealias Resolver = (Parameters) -> Type
    
    var resolver: Resolver
    var resolved: Type?
    
    init(resolver: @escaping Resolver) {
        self.resolver = resolver
    }
    
    func resolve(_ parameters: Parameters) -> Type {
        if let resolved = self.resolved {
            return resolved
        }
        let resolved = resolver(parameters)
        self.resolved = resolved
        return resolved
    }
}

class Resolver<Type>: Lazy<Type, Void> {
    
    func resolve() -> Type {
        return resolve(())
    }
}
