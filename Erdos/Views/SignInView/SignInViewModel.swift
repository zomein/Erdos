//
//  SignInViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import Foundation
import ProgressHUD

final class SignInViewModel {
    // other objects can subscribe/bind to listen to changes from this observable object
    var signInSuccessful: ObservableObject<Bool?> = ObservableObject(nil)
    
    func signIn(email: String, password: String) {
        NetworkingManager.shared.signIn(email: email, password: password) { wasSuccessful in
            self.signInSuccessful.value = wasSuccessful
        }
    }
}
