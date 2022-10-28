//
//  URLModifier.swift
//  
//
//  Created by Tim on 24/10/2022.
//

import Foundation

/// URLModifier DSL.
@resultBuilder
public enum URLModifier {
    public static func buildExpression(_ scheme: Scheme) -> some URLComponentsCompatible {
        return scheme
    }
    
    public static func buildExpression(_ auth: Auth) -> some URLComponentsCompatible {
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
    
    public static func buildBlock(_ components: URLComponentsCompatible...) -> [any URLComponentsCompatible] {
        return components
    }

}

extension URL {
    
    /// Modify an URL using URLModifier DSL.
    /// - Parameter modifier: a modifier that captures the URL components that must be modified.
    /// - Returns: a new modified URL
    public func modified(@URLModifier _ modifier: () -> [URLComponentsCompatible]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)!
        
        for component in modifier() {
            component.update(&components)
        }
        
        return components.url ?? self
    }
}
