//
//  FilesPipeFactory.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import PowerTools

public protocol IFilesPipeFactory {
    func pipe(for folder: Folder) -> PowerTools.Pipe<[SectionViewModel]>
}

struct FilesPipeFactory: IFilesPipeFactory {
    
    var folderRepository: IFolderRepository
    var sectionVMFactory: IFolderSectionVMFactory
    var fileVMFactory: IFileVMFactory

    func pipe(for folder: Folder) -> PowerTools.Pipe<[SectionViewModel]> {
        return FilesPipe(folderRepository: folderRepository,
                         sectionFactory: sectionVMFactory,
                         fileVMFactory: fileVMFactory,
                         folder: folder)
    }
}
