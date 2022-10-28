//
//  Query.swift
//  
//
//  Created by Tim on 24/10/2022.
//

import Foundation

/// A single query of an URL.
public struct Query {
    public let name: String
    public let value: String?
    
    public init(name: String, value: String? = nil) {
        self.name = name
        self.value = value
    }    
}
