//
//  SignInViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import Foundation
import ProgressHUD // 3rd party loading indicator package

// responsible for all business logic dealing with the sign in page
final class SignInViewModel {
    var signInSuccessful: ObservableObject<Bool?> = ObservableObject(nil)
    
    func signIn(email: String, password: String) {
        ProgressHUD.show()
        NetworkingManager.shared.signIn(email: email, password: password) { wasSuccessful in
            self.signInSuccessful.value = wasSuccessful
            ProgressHUD.dismiss()
        }
    }
}
