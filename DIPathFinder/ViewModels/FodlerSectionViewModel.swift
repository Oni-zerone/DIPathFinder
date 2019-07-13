//
//  FodlerSectionViewModel.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import PowerTools
import DomainModel

struct FolderSectionVMFactory: IFolderSectionVMFactory {
    
    func buildSection(header: ItemViewModel?, items: [ItemViewModel], footer: ItemViewModel?) -> SectionViewModel {
        return FolderSectionViewModel(header: header,
                                      items: items,
                                      footer: footer)
    }
}

struct FolderSectionViewModel: SectionViewModel {
    var header: ItemViewModel?
    
    var items: [ItemViewModel]
    
    var footer: ItemViewModel?
}

extension FolderSectionViewModel: GridSection {
    
    var lineItems: Int? {
        return 1
    }
}
