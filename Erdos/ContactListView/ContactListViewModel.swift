//
//  ContactListViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/20/23.
//

import Foundation
import ProgressHUD

final class ContactListViewModel {
    var friends: ObservableObject<[Friend]?> = ObservableObject(nil)
    
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
