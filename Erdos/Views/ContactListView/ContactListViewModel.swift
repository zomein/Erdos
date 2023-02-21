//
//  ContactListViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/20/23.
//

import Foundation
import ProgressHUD

protocol FetchedFriendsDelegate {
    func updateView(with friends: [Friend])
}

class ContactListViewModel {
    private let networkingService: FriendFetchingService
    var delegate: FetchedFriendsDelegate?
    var friends: [Friend]?
    
    init(networkingService: FriendFetchingService) {
        self.networkingService = networkingService
    }
    
    func fetchFriends() {
        ProgressHUD.animationType = .circleRotateChase
        ProgressHUD.colorAnimation = .blue
        ProgressHUD.show("Loading Contacts...")
        networkingService.fetchAllFriends { [weak self] result in
            switch result {
            case .success(let friends):
                self?.friends = friends
                self?.delegate?.updateView(with: friends)
                ProgressHUD.dismiss()
            case .failure(let err):
                ProgressHUD.showError(err.localizedDescription)
            }
        }
    }
}
