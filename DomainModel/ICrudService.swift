//
//  ICrudService.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation

public protocol ICrudService {
    
    func createFolder(name: String, path: String) throws -> Folder
}
