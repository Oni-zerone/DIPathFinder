//
//  CRUDService.swift
//  DataAccess
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation
import DomainModel

class CrudService: ICrudService {
    
    var folderResolver: IFolderResolver
    
    init(folderResolver: IFolderResolver) {
        self.folderResolver = folderResolver
    }
    
    func createFolder(name: String, path: String) throws -> DomainModel.Folder {
        let currentFolder = folderResolver.makeFolder(from: path)
        let subfolder = try currentFolder.createSubfolder(named: name)
        return FilesFolder(folder: subfolder)
    }
}

