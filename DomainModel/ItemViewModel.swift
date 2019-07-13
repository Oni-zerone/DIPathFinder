//
//  ItemViewModel.swift
//  DomainModel
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import Foundation
import PowerTools

protocol CellView {
    associatedtype ViewModel
    
    func setup(model: ViewModel)
}

public protocol CellViewModel: ItemViewModel {
    
    associatedtype Cell
    
//    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
//        self.
//    }
}
