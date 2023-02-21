//
//  HomeViewController.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    let viewModel: ContactListViewModel
    
    init(viewModel: ContactListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifier)
        tableView.separatorStyle = .none
        
        setupUI()
        setupBindings()
        
        viewModel.fetchFriends()
    }
    
    private func setupUI() {
        navigationItem.title = "Contacts"
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeBtnTapped))
    }
    
    // listen to/handle changes in friends array
    private func setupBindings() {
        viewModel.friends.bind { [weak self] friends in
            self?.tableView.reloadData()
        }
    }
    
    @objc func closeBtnTapped(button: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: TableView Datasource & Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friends.value?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell,
            let friends = viewModel.friends.value
        else {
            fatalError("could not dequeue friend cell")
        }
        
        friendCell.selectionStyle = .none
        friendCell.accessoryType = .disclosureIndicator
        friendCell.configure(friend: friends[indexPath.row])
        
        return friendCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let friends = viewModel.friends.value else {
            fatalError("friends must be populated for contact list")
        }
        
        let currentFriend = friends[indexPath.row]
        let friendName = currentFriend.name
        let detailsViewModel = ContactDetailsViewModel(friendName: friendName)
        let detailsVC = ContactDetailsViewController(viewModel: detailsViewModel)
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
