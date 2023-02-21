//
//  SignInViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import Foundation

protocol SignInServiceDelegate {
    func updateViewOnSignIn(isSuccessful: Bool)
}

class SignInViewModel {
    private let networkingService: FriendFetchingService
    var delegate: SignInServiceDelegate?
    
    init(networkingService: FriendFetchingService) {
        self.networkingService = networkingService
    }
    
    func signIn(email: String, password: String) {
        networkingService.signIn(email: email, password: password) { [weak self] successResult in
            self?.delegate?.updateViewOnSignIn(isSuccessful: successResult)
        }
    }
}
