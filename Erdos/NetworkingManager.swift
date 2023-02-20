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
    
    // MARK: Fetching Calls
    func fetchAllFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        print("fetching all friends...")
        
        // mock network call that takes 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("fetch complete")
            completion(.success(Server.friendsData))
        }
    }
}
