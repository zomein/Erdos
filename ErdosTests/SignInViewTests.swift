//
//  SignInViewTests.swift
//  ErdosTests
//
//  Created by Eric Barnes on 2/21/23.
//

import XCTest
@testable import Erdos

final class SignInViewTests: XCTestCase {
    
    private var sut: SignInViewModel!
    private var networkingManager: MockNetworkingManager!
    private var mockDelegate: MockSignInResultDelegate!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockDelegate = MockSignInResultDelegate()
        networkingManager = MockNetworkingManager()
        sut = SignInViewModel(networkingService: networkingManager)
        sut.delegate = mockDelegate
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        networkingManager = nil
        mockDelegate = nil
    }
    
    func testSignIn_onSuccess() {
        // given: that our sign in is successful
        let isSuccessful = true
        networkingManager.isSignInSuccessfulResult = isSuccessful
        
        // when: sign in completes
        sut.signIn(email: "Test@test.com", password: "password") // this will update delegate.viewUpdatesArray
        
        // then: we expect....
        XCTAssertEqual(mockDelegate.viewUpdatesArray.count, 1) // view to have been updated once
        XCTAssertTrue(mockDelegate.viewUpdatesArray[0]) // view to have been updated with a true value, since successful
    }
    
    func testSignIn_onFailure() {
        // given: that our sign fails
        let isSuccessful = false
        networkingManager.isSignInSuccessfulResult = isSuccessful
        
        // when: sign in function is called
        sut.signIn(email: "Test@test.com", password: "password")
        
        // then: we expect....
        XCTAssertEqual(mockDelegate.viewUpdatesArray.count, 1) // view to have been updated once
        XCTAssertFalse(mockDelegate.viewUpdatesArray[0]) // view to have been updated with a false value, since failed
    }
    
}

class MockSignInResultDelegate: SignInServiceDelegate {
    var viewUpdatesArray: [Bool] = []
    
    func updateViewOnSignIn(isSuccessful: Bool) {
        viewUpdatesArray.append(isSuccessful)
    }
}
