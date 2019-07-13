//
//  FolderCreatorViewController.swift
//  DIPathFinder
//
//  Created by Andrea Altea on 13/07/2019.
//  Copyright © 2019 Andrea Altea. All rights reserved.
//

import UIKit
import DomainModel

class FolderCreatorViewController: UIViewController {

    var folder: Folder!
    var crudService: ICrudService!
    
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Create Folder"
    }
    
    @IBAction func createFolder(_ sender: Any) {
        guard let name = textFiled.text,
            !name.isEmpty else { return }
        do {
            _ = try crudService.createFolder(name: name, path: folder.path)
            self.dismiss(animated: true)
        } catch { }
    }
}
