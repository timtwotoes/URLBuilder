//
//  Port.swift
//  
//
//  Created by Tim Wolff on 19/10/2022.
//

import Foundation

/// Port of an URL.
public struct Port: URLComponentsCompatible {
    private let value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
    
    public func update(_ components: inout URLComponents) {
        components.port = value
    }
}
