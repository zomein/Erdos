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
    
    private var fetchedFriends: [Friend]?

    private init() { }
    
    // MARK: Mock Sign In Authentication
    func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if email == "Test@test.com" && password == "password" {
                print("sign in success!")
                completion(true)
            } else {
                print("sign in failed")
                completion(false)
            }
        }
    }
    
    // MARK: Mock Fetching Calls
    func fetchAllFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("fetch complete")
            completion(.success(Server.friendsData))
        }
    }
}
