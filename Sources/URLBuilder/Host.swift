//
//  Host.swift
//  
//
//  Created by Tim on 19/10/2022.
//

import Foundation

public struct Host: URLComponentsCompatible {
    private let name: String
    
    public init(_ name: String) {
        let expression = try! NSRegularExpression(pattern: #"^(?:https?://)?(?:[^@\/\n]+@)?(?:www\.)?([^:/?\n]+)"#)
        let range = NSRange(name.startIndex..<name.endIndex, in: name)
        if let match = expression.firstMatch(in: name, range: range) {
            self.name = String(name[Range(match.range(at: 1), in: name)!])
        } else {
            self.name = ""
        }
    }
    
    public func update(_ components: inout URLComponents) {
        components.host = name
    }
}
