//
//  DependencyBuilder.swift
//  DataAccess
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation
import DomainModel
import Dip

public struct DataAccessModule {
    
    public static func register(in container: DependencyContainer, rootPath: String) {
        container.register { FolderResolver() as IFolderResolver }
        container.register { FolderRepository(folderResolver: $0, rootPath: rootPath) as IFolderRepository }
        container.register { CrudService(folderResolver: $0) as ICrudService }
    }
}
