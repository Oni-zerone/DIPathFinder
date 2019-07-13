//
//  FolderRepository.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation

public protocol IFolderRepository {
    
    func getRootFolder() -> Folder
    
    func getFolders(in folder: Folder) -> [Folder]
    func getFiles(in folder: Folder) -> [File]
}
