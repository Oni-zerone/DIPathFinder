//
//  FilesFolder.swift
//  DataAccess
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Files
import DomainModel

public struct FilesFolder: DomainModel.Folder {
    
    internal init(folder: Files.Folder) {
        self.path = folder.path
        self.name = folder.name
    }
    
    public var path: String
    
    public var name: String
}
