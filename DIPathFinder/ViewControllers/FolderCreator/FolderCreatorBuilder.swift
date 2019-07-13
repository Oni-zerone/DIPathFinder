//
//  FolderCreatorBuilder.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import PowerTools
import DomainModel

class FolderCreatorBuilder: IFolderControllerBuilder {

    var crudService: ICrudService
    var storyboard: Resolver<UIStoryboard>

    init(crudService: ICrudService,
         storyboard: Resolver<UIStoryboard>) {
        self.crudService = crudService
        self.storyboard = storyboard
    }
    
    override func build(_ context: Folder) -> UIViewController? {
        let controller = storyboard.resolve().instantiateViewController(withIdentifier: "FolderCreatorViewController") as? FolderCreatorViewController
        controller?.folder = context
        controller?.crudService = crudService
        return controller
    }
}
