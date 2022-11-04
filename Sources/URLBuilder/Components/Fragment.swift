//
//  Fragment.swift
//  
//
//  Created by Tim Wolff on 24/10/2022.
//

import Foundation

/// Fragment of an URL.
public struct Fragment: URLComponentsCompatible {
    private let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public func update(_ components: inout URLComponents) {
        components.fragment = value
    }
}
