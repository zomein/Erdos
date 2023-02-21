//
//  ContactDetailsViewModel.swift
//  Erdos
//
//  Created by Eric Barnes on 2/20/23.
//

import Foundation

// using protocol delegate pattern in this view model to demonstrate one to one communication
protocol ContactDetailsDelegate: AnyObject {
    func updateView(friendName: String)
}

final class ContactDetailsViewModel {
    var friendName: String // only data needed for contact detail page
    weak var delegate: ContactDetailsDelegate?
    
    init(friendName: String) {
        self.friendName = friendName
    }
    
    func getContactDetails() {
        delegate?.updateView(friendName: friendName)
    }
}
