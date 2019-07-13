//
//  DependencyBuilder.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Dip
import PowerTools

public struct DomainModelModule {
    
    public static func register(in container: DependencyContainer) {
        container.attach(PipeBuilder.self)
        container.attach(PipelineBuilder.self)
    }
}

struct PipeBuilder: DipModule {
    
    static func register(in container: DependencyContainer) {
        container.register { FolderPipeFactory(folderRepository: $0,
                                               sectionVMFactory: $1,
                                               folderVMFactory: $2) as IFolderPipeFactory
        }
        
        container.register { FilesPipeFactory(folderRepository: $0,
                                              sectionVMFactory: $1,
                                              fileVMFactory: $2) as IFilesPipeFactory
        }
    }
}

struct PipelineBuilder: DipModule {
    static func register(in container: DependencyContainer) {
        container.register { FolderPipelineFactory(folderPipeFactory: $0, filePipeFactory: $1) as IFolderPipelineFactory }
    }
}
