//
//  Body.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

public struct Body: URLRequestCompatible {
    private let data: Data
    
    public init(_ data: Data) {
        self.data = data
    }
    
    public func update(_ request: inout URLRequest) {
        request.httpBody = data
    }
}
