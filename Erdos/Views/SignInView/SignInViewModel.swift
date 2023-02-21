//
//  SignInViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import Foundation
import ProgressHUD

final class SignInViewModel {
    private let networkingService: FriendFetchingService
    var signInSuccessful: ObservableObject<Bool?> = ObservableObject(nil)
    
    init(networkingService: FriendFetchingService) {
        self.networkingService = networkingService
    }
    
    func signIn(email: String, password: String) {
        networkingService.signIn(email: email, password: password) { wasSuccessful in
            self.signInSuccessful.value = wasSuccessful
        }
    }
}
