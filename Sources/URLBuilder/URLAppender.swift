//
//  URLAppender.swift
//  
//
//  Created by Tim Wolff on 25/10/2022.
//

import Foundation

/// URLAppender DSL.
@resultBuilder
public struct URLAppender {
    private let path: Path?
    private let queries: Queries?
    
    public static func buildBlock(_ path: Path) -> URLAppender {
        return URLAppender(path: path)
    }
    
    public static func buildBlock(_ queries: Queries) -> URLAppender {
        return URLAppender(queries: queries)
    }
    
    public static func buildBlock(_ path: Path, _ queries: Queries) -> URLAppender {
        return URLAppender(path: path, queries: queries)
    }
    
    public static func buildBlock(_ queries: Queries, _ path: Path) -> URLAppender {
        return URLAppender(path: path, queries: queries)
    }
    
    public init(path: Path? = nil, queries: Queries? = nil) {
        self.path = path
        self.queries = queries
    }
    
    public func append(to url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        if let path {
            if !components.path.contains(".") {
                if components.path.hasPrefix("/") {
                    components.path += path.value
                } else {
                    components.path += "/" + path.value
                }
            }
        }
        
        if let queries {
            var items = components.queryItems != nil ? components.queryItems! : [URLQueryItem]()
            
            for query in queries.queries {
                items.append(URLQueryItem(name: query.name, value: query.value))
            }
            
            components.queryItems = items
        }
        
        return components.url ?? url
    }
}

extension URL {
    
    /// Appending components to an URL using URLAppender DSL.
    /// - Parameter appender: an appender that captures the components to append to URL.
    /// - Returns: new URL with the appended components.
    public func appending(@URLAppender _ appender: () -> URLAppender) -> URL {
        return appender().append(to: self)
    }
}
