//
//  Auth.swift
//  
//
//  Created by Tim on 19/10/2022.
//

import Foundation


/// Authentication component of an URL.
public struct Auth: URLComponentsCompatible {
    private let username: String
    private let password: String
    
    /// Authentication with username and password
    /// - Parameters:
    ///   - username: username of the URL
    ///   - password: password of the URL
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    public func update(_ components: inout URLComponents) {
        components.user = username
        components.password = password
    }
}
