//
//  Host.swift
//  
//
//  Created by Tim on 19/10/2022.
//

import Foundation

public struct Host: URLComponentsCompatible {
    private static let hostRegExPattern = try! NSRegularExpression(pattern: #"^(?:https?://)?(?:[^@\/\n]+@)?(?:www\.)?([^:/?\n]+)"#)
    private let name: String

    private static func extractHost(from string: String) -> String {
        if let match = hostRegExPattern.firstMatch(in: string) {
            if let hostRange = Range(match.range(at: 1), in: string) {
                return String(string[hostRange])
            } else {
                return ""
            }
        } else {
            return ""
        }
    }
    
    public init(_ name: String) {
        self.name = Host.extractHost(from: name)
    }
    
    public func update(_ components: inout URLComponents) {
        components.host = name
    }
}

extension NSRegularExpression {
    func firstMatch(in string: String) -> NSTextCheckingResult? {
        let range = NSRange(string.startIndex..<string.endIndex, in: string)
        return self.firstMatch(in: string, range: range)
    }
}
