//
//  URLRequestModifier.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

@resultBuilder
public enum URLRequestModifier {
    public static func buildExpression(_ url: URL) -> some URLRequestCompatible {
        return URLWrapper(url)
    }
    
    public static func buildExpression(_ method: Method) -> some URLRequestCompatible {
        return method
    }
    
    public static func buildExpression(_ body: Body) -> some URLRequestCompatible {
        return body
    }
    
    public static func buildExpression(_ header: Header) -> some URLRequestCompatible {
        return header
    }
    
    public static func buildBlock(_ components: URLRequestCompatible...) -> [URLRequestCompatible] {
        return components
    }
}

private struct URLWrapper: URLRequestCompatible {
    private let url: URL
    
    public init(_ url: URL) {
        self.url = url
    }
    
    public func update(_ request: inout URLRequest) {
        request.url = url
    }
}

extension URLRequest {
    public func modifying(@URLRequestModifier _ modifier: () -> [URLRequestCompatible]) -> URLRequest {
        var request = self
        
        for component in modifier() {
            component.update(&request)
        }
        
        return request
    }
}
