//
//  ContactDetailsViewController.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Contact Name"
        view.backgroundColor = .secondarySystemGroupedBackground
    }
}
