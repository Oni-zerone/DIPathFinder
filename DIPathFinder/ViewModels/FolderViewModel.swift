//
//  FolderViewModel.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import PowerTools
import DomainModel

protocol VCPresenter {
    
    func presentable() -> UIViewController?
}

class FolderVMFactory: IFolderVMFactory {

    var descriptor: ItemViewDescriptor
    var builderResolver: Resolver<Builder<DomainModel.Folder>>
    
    init(descriptor: ItemViewDescriptor, builderResolver: Resolver<Builder<DomainModel.Folder>>) {
        self.descriptor = descriptor
        self.builderResolver = builderResolver
    }
    
    func build(_ folder: DomainModel.Folder) -> ItemViewModel {
        return FolderViewModel(descriptor: descriptor,
                               folder: folder,
                               builderResolver: builderResolver)
    }
}

public protocol FolderView {
    func setup(folder: DomainModel.Folder)
}

struct FolderViewModel: ItemViewModel, GridItem {
    
    var descriptor: ItemViewDescriptor
    var folder: DomainModel.Folder
    var builderResolver: Resolver<Builder<DomainModel.Folder>>
    
    var hashValue: Int {
        return self.folder.path.hashValue
    }

    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
        (view as? FolderView)?.setup(folder: folder)
    }
}

extension FolderViewModel: VCPresenter {

    func presentable() -> UIViewController? {
        let builder = builderResolver.resolve()
        return builder.build(folder)
    }
}
