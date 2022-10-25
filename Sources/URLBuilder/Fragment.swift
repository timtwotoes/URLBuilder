//
//  Fragment.swift
//  
//
//  Created by Tim on 24/10/2022.
//

import Foundation

public struct Fragment: URLComponentsCompatible {
    private let value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public func update(_ components: inout URLComponents) {
        components.fragment = value
    }
}
