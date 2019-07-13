//
//  RootAssembler.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import UIKit
import PowerTools
import DomainModel

protocol IRootAssembler {
    func build() -> UIViewController?
}

struct RootAssembler: IRootAssembler {
    
    var folderRepository: IFolderRepository
    var rootBuilder: IFolderControllerBuilder
    
    func build() -> UIViewController? {
        let folder = folderRepository.getRootFolder()
        guard let viewController = rootBuilder.build(folder) else { return nil }
        return UINavigationController(rootViewController: viewController)
    }
}
