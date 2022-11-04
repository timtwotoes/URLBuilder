//
//  Method.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

public struct Method: URLRequestCompatible {
    private let name: String
    
    public init(_ name: String) {
        self.name = name
    }
    
    public func update(_ request: inout URLRequest) {
        request.httpMethod = name
    }
}
