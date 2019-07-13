//
//  PipelineFactory.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import PowerTools

public protocol IFolderPipelineFactory {
    func folderPipeline(for folder: Folder) -> Pipeline<[SectionViewModel]>
}

struct FolderPipelineFactory: IFolderPipelineFactory {
    
    var folderPipeFactory: IFolderPipeFactory
    var filePipeFactory: IFilesPipeFactory
    
    func folderPipeline(for folder: Folder) -> Pipeline<[SectionViewModel]> {
        var pipeline = Pipeline<[SectionViewModel]>()
        pipeline.attach(folderPipeFactory.pipe(for: folder))
        pipeline.attach(filePipeFactory.pipe(for: folder))
        return pipeline
    }
}
