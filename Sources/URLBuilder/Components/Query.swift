//
//  Query.swift
//  
//
//  Created by Tim Wolff on 24/10/2022.
//

import Foundation

/// A single query of an URL.
public struct Query {
    internal let name: String
    internal let value: String?
    
    public init(name: String, value: String? = nil) {
        self.name = name
        self.value = value
    }    
}
