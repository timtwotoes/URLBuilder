//
//  Scheme.swift
//  
//
//  Created by Tim on 19/10/2022.
//

import Foundation

/// Scheme of an URL.
public struct Scheme: URLComponentsCompatible {
    private let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public func update(_ components: inout URLComponents) {
        components.scheme = value
    }
}
