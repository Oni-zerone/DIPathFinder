//
//  ViewControllerFactory.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import UIKit
import PowerTools
import DomainModel

typealias IFolderControllerBuilder = Builder<DomainModel.Folder>

class FolderControllerBuilder: IFolderControllerBuilder {
    
    var storyboard: Resolver<UIStoryboard>
    var pipelineFactory: IFolderPipelineFactory
    var creatorBuilder: IFolderControllerBuilder
    
    init(storyboard: Resolver<UIStoryboard>,
         pipelineFactory: IFolderPipelineFactory,
         creatorBuilder: IFolderControllerBuilder) {
        self.pipelineFactory = pipelineFactory
        self.storyboard = storyboard
        self.creatorBuilder = creatorBuilder
    }
    
    override func build(_ context: DomainModel.Folder) -> UIViewController? {
        let controller = storyboard.resolve().instantiateViewController(withIdentifier: "FolderViewController") as? FolderViewController
        controller?.folder = context
        controller?.pipeline = pipelineFactory.folderPipeline(for: context)
        controller?.creatorBuilder = creatorBuilder
        return controller
    }
}
