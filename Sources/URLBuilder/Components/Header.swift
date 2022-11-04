//
//  Header.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

public struct Header: URLRequestCompatible {
    public enum Modes {
        case set
        case add
    }
    
    internal let fields: [Field]
    private let mode: Modes
    
    public init(mode: Modes = .set, @HeaderBuilder _ fields: () -> [Field]) {
        self.mode = mode
        self.fields = fields()
    }
    
    public func update(_ request: inout URLRequest) {
        for field in fields {
            switch mode {
            case .add: request.addValue(field.value, forHTTPHeaderField: field.name)
            case .set: request.setValue(field.value, forHTTPHeaderField: field.name)
            }
            
        }
    }
}
