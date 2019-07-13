//
//  FilesFile.swift
//  DataAccess
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import DomainModel
import Files

struct FilesFile: DomainModel.File {
    
    var path: String
    
    var name: String
    
    var fileExtension: String
    
    init(file: Files.File) {
        self.path = file.path
        self.name = file.nameExcludingExtension
        self.fileExtension = file.extension ?? ""
    }
}
