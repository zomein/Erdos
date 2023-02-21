//
//  ContactDetailsViewController.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    let viewModel: ContactDetailsViewModel
    
    // dependency injection for viewModel
    init(viewModel: ContactDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self // allows view model to communicate with this class
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        showContactDetails()
    }
    
    private func setupUI() {
        view.backgroundColor = .secondarySystemGroupedBackground
    }
    private func showContactDetails() {
        viewModel.getContactDetails()
    }
}

extension ContactDetailsViewController: ContactDetailsDelegate {
    func updateView(friendName: String) {
        navigationItem.title = friendName
    }
}
