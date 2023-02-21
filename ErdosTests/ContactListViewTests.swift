//
//  ContactListViewTests.swift
//  ErdosTests
//
//  Created by Eric Barnes on 2/21/23.
//

import XCTest
@testable import Erdos

final class ContactListViewTests: XCTestCase {
    private var sut: ContactListViewModel!
    private var networkingManager: MockNetworkingManager!
    private var mockDelegate: MockFetchedFriendsDelegate!
    
    override func setUpWithError() throws {
        mockDelegate = MockFetchedFriendsDelegate()
        networkingManager = MockNetworkingManager()
        sut = ContactListViewModel(networkingService: networkingManager)
        sut.delegate = mockDelegate
    }

    override func tearDownWithError() throws {
        sut = nil
        networkingManager = nil
        mockDelegate = nil
    }
    
    func testUpdateView_forFriendsFetchSuccess() {
        // given
        let friendsFetched: [Friend] = [
            .init(name: "Bob Smith", email: "bob@gmail.com"),
            .init(name: "Larry Bird", email: "larry@gmail.com"),
        ]
        
        networkingManager.fetchedFriendsResult = .success(friendsFetched)
        
        XCTAssertEqual(mockDelegate.viewUpdatesArray.count, 0) // no friends fetched yet
        
        // when
        sut.fetchFriends()
        
        // then: we expect...
        XCTAssertEqual(mockDelegate.viewUpdatesArray.count, 1) // view has now been updated once
        XCTAssertEqual(mockDelegate.viewUpdatesArray[0].count, 2) // our 2 friends have been passed to delegate
    }
    
    func testUpdateView_forFriendsFetchFailure() {
        // given
        networkingManager.fetchedFriendsResult = .failure(.randomError)
        
        XCTAssertEqual(mockDelegate.viewUpdatesArray.count, 0) // no friends fetched yet
        
        // when
        sut.fetchFriends()
        
        // then: we expect...
        XCTAssertFalse(mockDelegate.viewUpdatesArray.count > 0) // view should not have been told to update since fetch failed
        
    }

}

class MockFetchedFriendsDelegate: FetchedFriendsDelegate {
    var viewUpdatesArray: [[Friend]] = [] // since a new array of friends will be passed on each update
    
    func updateView(with friends: [Friend]) {
        viewUpdatesArray.append(friends)
    }
}
