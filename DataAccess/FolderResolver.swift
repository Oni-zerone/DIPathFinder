//
//  FolderResolver.swift
//  DataAccess
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation
import Files

class FolderResolver: IFolderResolver {
    
    func makeFolder(from path: String) -> Files.Folder {
        return try! Folder(path: path)
    }
}
