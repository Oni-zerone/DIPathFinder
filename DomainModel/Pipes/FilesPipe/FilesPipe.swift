//
//  FilesPipe.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import PowerTools

public protocol IFileVMFactory {
    
    func make(_ file: File) -> ItemViewModel
}

class FilesPipe: PowerTools.Pipe<[SectionViewModel]> {
    
    var folderRepository: IFolderRepository
    var sectionFactory: IFolderSectionVMFactory
    var fileVMFactory: IFileVMFactory
    var folder: Folder
    
    init(folderRepository: IFolderRepository,
         sectionFactory: IFolderSectionVMFactory,
         fileVMFactory: IFileVMFactory,
         folder: Folder) {
        self.folderRepository = folderRepository
        self.sectionFactory = sectionFactory
        self.fileVMFactory = fileVMFactory
        self.folder = folder
    }
    
    override func success(_ content: [SectionViewModel]) {
        
        let files = folderRepository.getFiles(in: folder)
        let viewModels = files.map { fileVMFactory.make($0) }
        let section = sectionFactory.buildSection(header: nil, items: viewModels, footer: nil)
        self.send(content.appending(section))
    }
}
