//
//  NetworkingManager.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import Foundation

final class NetworkingManager {
    
    // MARK: establish as singleton
    static let shared = NetworkingManager()

    private init() { }
    
    // MARK: Mock Sign In Authentication
    func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.async {
            if email == "Test@test.com" && password == "password" {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    // MARK: Mock Fetching Calls
    func fetchAllFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // simulate 3 second fetch call
            completion(.success(Server.friendsData))
        }
    }
}
