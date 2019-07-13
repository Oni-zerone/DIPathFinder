//
//  FolderPipe.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import PowerTools

public protocol ISectionVMFactory {
    
    func buildSection(header: ItemViewModel?, items: [ItemViewModel], footer: ItemViewModel?) -> SectionViewModel
}

public protocol IFolderSectionVMFactory: ISectionVMFactory {}

public protocol IFolderVMFactory {
    
    func build(_ folder: Folder) -> ItemViewModel
}

public class FolderPipe: PowerTools.Pipe<[SectionViewModel]> {
    
    var folderRepository: IFolderRepository
    var sectionVMFactory: IFolderSectionVMFactory
    var folderVMFactory: IFolderVMFactory
    var referenceFolder: Folder
    
    init(folderRepository: IFolderRepository,
         sectionVMFactory: IFolderSectionVMFactory,
         folderVMFactory: IFolderVMFactory,
         referenceFolder: Folder) {
        self.folderRepository = folderRepository
        self.sectionVMFactory = sectionVMFactory
        self.folderVMFactory = folderVMFactory
        self.referenceFolder = referenceFolder
    }
    
    public override func success(_ content: [SectionViewModel]) {
        let folders = folderRepository.getFolders(in: referenceFolder)
        let viewModels = folders.map { folderVMFactory.build($0) }
        let section = sectionVMFactory.buildSection(header: nil, items: viewModels, footer: nil)
        self.send(content.appending(section))
    }
}
