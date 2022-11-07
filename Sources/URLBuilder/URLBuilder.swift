//
//  Scheme.swift
//
//
//  Created by Tim Wolff on 19/10/2022.
//

import Foundation

/// URLBuilder DSL.
@resultBuilder
public enum URLBuilder {
    private static let defaultScheme = "https"
    
    public static func buildExpression(_ scheme: Scheme) -> some URLComponentsCompatible {
        return scheme
    }
    
    public static func buildExpression(_ auth: Authentication) -> some URLComponentsCompatible {
        return auth
    }
    
    public static func buildExpression(_ host: Host) -> some URLComponentsCompatible {
        return host
    }
    
    public static func buildExpression(_ port: Port) -> some URLComponentsCompatible {
        return port
    }
    
    public static func buildExpression(_ path: Path) -> some URLComponentsCompatible {
        return path
    }
    
    public static func buildExpression(_ queries: Queries) -> some URLComponentsCompatible {
        return queries
    }
    
    public static func buildExpression(_ fragment: Fragment) -> some URLComponentsCompatible {
        return fragment
    }
    
    public static func buildBlock(_ objects: URLComponentsCompatible...) -> URL? {
        var components = URLComponents()
        for object in objects {
            object.update(&components)
        }
        
        if components.scheme == nil {
            components.scheme = defaultScheme
        }
        
        if let host = components.host {
            return host.isEmpty ? nil : components.url
        } else {
            return nil
        }
    }
    
}

extension URL {
    
    /// Construct an URL using URLBuilder DSL.
    /// - Parameter _:  Block that captures DSL components and builds an URL.
    public init?(@URLBuilder _ content: () -> URL?) {
        if let url = content() {
            self = url
        } else {
            return nil
        }
    }
    
    public init(_ components: any URLComponentsCompatible) {
        var urlComponents = URLComponents()
        
        components.update(&urlComponents)

        guard let url = urlComponents.url else {
            fatalError("\(urlComponents.description) does not produce a valid URL")
        }
        
        self = url
    }
}
