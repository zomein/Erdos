//
//  ContactDetailsViewTests.swift
//  ErdosTests
//
//  Created by Eric Barnes on 2/21/23.
//

import XCTest
@testable import Erdos

final class ContactDetailsViewTests: XCTestCase {

    private var sut: ContactDetailsViewModel!
    private var mockDelegate: MockContactDetailsDelegate!
    private let mockFriendName = "Test Johnson"
    
    override func setUpWithError() throws {
        mockDelegate = MockContactDetailsDelegate()
        sut = ContactDetailsViewModel(friendName: mockFriendName)
        sut.delegate = mockDelegate
    }

    override func tearDownWithError() throws {
        sut = nil
        mockDelegate = nil
    }
    
    func testUpdateView_forFriendName_onSuccess() {
        // given
            // mockFriendName declared above as input
        
        XCTAssertEqual(mockDelegate.viewUpdatesArray.count, 0)
        
        // when
        sut.getContactDetails()
        
        // then: expected output
        XCTAssertEqual(mockDelegate.viewUpdatesArray.count, 1) // delegate's view should have been updated
        XCTAssertEqual(mockDelegate.viewUpdatesArray[0], mockFriendName) // we expect mockFriendName to be passed to delegate
    }
    
    
}

class MockContactDetailsDelegate: ContactDetailsDelegate {
    var viewUpdatesArray: [String] = [] // since a new array of friends will be passed on each update
    
    func updateView(friendName: String) {
        viewUpdatesArray.append(friendName)
    }
}
