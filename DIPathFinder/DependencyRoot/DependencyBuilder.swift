//
//  DependencyBuilder.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation
import PowerTools
import DataAccess
import DomainModel
import Dip

struct DependencyBuilder {
    
    static func build(rootPath: String) -> DependencyContainer {
        let container = DependencyContainer()
        
        DataAccessModule.register(in: container, rootPath: rootPath)
        DomainModelModule.register(in: container)

        container.attach(ViewControllerModule.self)
        container.attach(BootModule.self)
        return container
    }
}

struct BootModule: DipModule {
    
    static func register(in container: DependencyContainer) {
        container.register { RootAssembler(folderRepository: $0,
                                           rootBuilder: try! container.resolve(tag: ViewControllerModule.Builder.folderController)) as IRootAssembler }
    }
}

struct ViewControllerModule: DipModule {
    enum Storyboard: String, DependencyTagConvertible {
        case main
    }
    
    enum Builder: String, DependencyTagConvertible {
        case folderController
        case creatorController
    }
    
    static func register(in container: DependencyContainer) {
        container.register(tag: Storyboard.main) { Resolver { UIStoryboard(name: "Main", bundle: .main) } }
        
        container.register(tag: Builder.creatorController) {
            FolderCreatorBuilder(crudService: $0,
                                 storyboard: try! container.resolve(tag: Storyboard.main)) as IFolderControllerBuilder
        }

        container.register(tag: Builder.folderController) {
            FolderControllerBuilder(storyboard: try! container.resolve(tag: Storyboard.main),
                                    pipelineFactory: $0,
                                    creatorBuilder: try! container.resolve(tag: Builder.creatorController)) as IFolderControllerBuilder
        }

        container.register { FolderSectionVMFactory() as IFolderSectionVMFactory }
        container.register { FolderVMFactory(descriptor: PathFinderCell.Descriptor(),
                                             builderResolver: Resolver { _ in try! container.resolve(tag: Builder.folderController) }) as IFolderVMFactory }
        container.register { FileVMFactory(descriptor: PathFinderCell.Descriptor()) as IFileVMFactory }
        container.register { }
    }
}
