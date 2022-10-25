//
//  Auth.swift
//  
//
//  Created by Tim on 19/10/2022.
//

import Foundation

public struct Auth: URLComponentsCompatible {
    private let username: String
    private let password: String
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    public func update(_ components: inout URLComponents) {
        components.user = username
        components.password = password
    }
}
