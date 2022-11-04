//
//  Field.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

public struct Field {
    internal let name: String
    internal let value: String
    
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
