//
//  HomeViewController.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        tableView.separatorStyle = .none
        
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Contacts"
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeBtnTapped))
    }
    
    @objc func closeBtnTapped(button: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: TableView Datasource & Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else {
            fatalError("could not dequeue friend cell")
        }
        
        friendCell.selectionStyle = .none
        friendCell.accessoryType = .disclosureIndicator
        friendCell.configure()
        
        return friendCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Showing contact details")
    }
    
}
