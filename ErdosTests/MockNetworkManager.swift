//
//  MockNetworkManager.swift
//  ErdosTests
//
//  Created by Eric Barnes on 2/21/23.
//

import Foundation
@testable import Erdos

class MockNetworkingManager: NetworkingManager {
    
    // use these variables to assign results for testing
    var isSignInSuccessfulResult: Bool?
    var fetchedFriendsResult: Result<[Friend], Error>?
    
    override func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        if let result = isSignInSuccessfulResult {
            completion(result)
        }
    }
    
    override func fetchAllFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        if let result = fetchedFriendsResult {
            completion(result)
        }
    }
}
