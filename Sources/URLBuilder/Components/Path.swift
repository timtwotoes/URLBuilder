//
//  Path.swift
//  
//
//  Created by Tim Wolff on 23/10/2022.
//

import Foundation

/// Path of an URL.
public struct Path: URLComponentsCompatible {
    internal let value: String
    
    public init(_ value: String) {
        var illegalCharacters = CharacterSet.urlPathAllowed.inverted
        illegalCharacters.insert("/")
        self.value = "/" + value.trimmingCharacters(in: illegalCharacters)
    }
    
    public func update(_ components: inout URLComponents) {
        components.path = value
    }
}
