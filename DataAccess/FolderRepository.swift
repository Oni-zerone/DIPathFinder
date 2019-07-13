//
//  FolderRepository.swift
//  DataAccess
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation
import DomainModel
import Files

protocol IFolderResolver {
    
    func makeFolder(from path: String) -> Files.Folder
}

public typealias RootPath = String

class FolderRepository: IFolderRepository {
    
    var folderResolver: IFolderResolver
    var rootPath: RootPath
    
    init(folderResolver: IFolderResolver, rootPath: RootPath) {
        self.folderResolver = folderResolver
        self.rootPath = rootPath
    }
    
    func getRootFolder() -> DomainModel.Folder {
        let folder = folderResolver.makeFolder(from: rootPath)
        try? folder.createFile(named: "README.txt")
        return FilesFolder(folder: folder)
    }
    
    func getFolders(in folder: DomainModel.Folder) -> [DomainModel.Folder] {
        let folder = folderResolver.makeFolder(from: folder.path)
        return folder.subfolders.map { FilesFolder(folder: $0) }
    }
    
    func getFiles(in folder: DomainModel.Folder) -> [DomainModel.File] {
        let folder = folderResolver.makeFolder(from: folder.path)
        return folder.files.map { FilesFile(file: $0) }
    }
}

