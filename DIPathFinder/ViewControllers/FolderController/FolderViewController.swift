//
//  ViewController.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import UIKit
import PowerTools
import DomainModel

class FolderViewController: UIViewController {
    
    var folder: DomainModel.Folder!
    var pipeline: PowerTools.Pipeline<[SectionViewModel]>!
    var creatorBuilder: IFolderControllerBuilder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pipeline.load([])
    }
    
    func setupUI() {
        self.title = folder.name
        self.view.backgroundColor = .white
        let gridVC = setupCollection()
        setupCells(gridVC)
        setupPipeline(gridVC)
        setupCreateButton()
    }
    
    func setupCollection() -> GridCollectionViewController {
        let gridVC = GridCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        gridVC.interactionDelegate = self
        gridVC.attach(to: self)
        return gridVC
    }
    
    func setupCells(_ gridVC: GridCollectionViewController) {
        gridVC.register(PathFinderCell.identifier, cellReuseIdentifier: PathFinderCell.identifier)
    }
    
    func setupPipeline(_ gridVC: GridCollectionViewController) {
        guard let dataSource = gridVC.dataSource else { return }
        pipeline.dataSource(dataSource)
    }
    
    func setupCreateButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createFolder(_:)))
    }
    
    @objc private func createFolder(_ sender: Any?) {
        guard let creatorVC = creatorBuilder.build(folder) else { return }
        self.present(creatorVC, animated: true)
    }
}

extension FolderViewController: InteractionDelegate {
    
    func containerView(_ containerView: UIView, didSelect item: ItemViewModel) {
        if let vc = (item as? VCPresenter)?.presentable() {
            self.show(vc, sender: self)
        }
    }
}
