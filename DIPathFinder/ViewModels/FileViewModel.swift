//
//  FileViewModel.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import DomainModel
import PowerTools

struct FileVMFactory: IFileVMFactory {
    
    var descriptor: ItemViewDescriptor
    
    func make(_ file: File) -> ItemViewModel {
        return FileViewModel(descriptor: descriptor, file: file)
    }
}

struct FileViewModel: ItemViewModel, GridItem {
    
    var descriptor: ItemViewDescriptor
    
    var file: DomainModel.File

    var hashValue: Int {
        return file.path.hashValue
    }
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
        (view as? RowCell)?.setupRowCell(file.name + "." + file.fileExtension)
    }
}
