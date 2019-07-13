//
//  FolderPipeFactory.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation
import PowerTools

protocol IFolderPipeFactory {
    func pipe(for folder: Folder) -> PowerTools.Pipe<[SectionViewModel]>
}

struct FolderPipeFactory: IFolderPipeFactory {
    
    var folderRepository: IFolderRepository
    var sectionVMFactory: IFolderSectionVMFactory
    var folderVMFactory: IFolderVMFactory
    
    func pipe(for folder: Folder) -> PowerTools.Pipe<[SectionViewModel]> {
        return FolderPipe(folderRepository: folderRepository,
                          sectionVMFactory: sectionVMFactory,
                          folderVMFactory: folderVMFactory,
                          referenceFolder: folder)
    }
}
