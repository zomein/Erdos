//
//  ObservableObject.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import Foundation

// object that can be subscribed/listened to
final class ObservableObject<T> {
    
    // data that is being listened to
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // closure called when data is inititally binded to and when observed data changes
    // we would have array of listeners in real world (one to many)
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    // allows observable object to be binded to, so that it can be observed/listened to
    func bind(_ listener: @escaping (T) -> Void) {
        self.listener = listener
    }
    
}
