//
//  ContactListViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/20/23.
//

import Foundation
import ProgressHUD

// using observable object to demonstrate one to many communication
final class ContactListViewModel {
    var friends: ObservableObject<[Friend]?> = ObservableObject(nil) // data needed for contact list
    
    func fetchFriends() {
        ProgressHUD.show()
        NetworkingManager.shared.fetchAllFriends { [weak self] result in
            switch result {
            case .success(let friends):
                self?.friends.value = friends
                ProgressHUD.dismiss()
            case .failure(let err):
                ProgressHUD.showError(err.localizedDescription)
            }
        }
    }
}
