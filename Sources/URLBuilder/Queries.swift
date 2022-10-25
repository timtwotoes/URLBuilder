//
//  Queries.swift
//  
//
//  Created by Tim on 24/10/2022.
//

import Foundation

public struct Queries: URLComponentsCompatible {
    internal let queries: [Query]
    
    public init(@QueryBuilder builder: () -> [Query]) {
        queries = builder()
    }
    
    public func update(_ components: inout URLComponents) {
        if !queries.isEmpty {
            var items = [URLQueryItem]()
            
            for query in queries {
                items.append(URLQueryItem(name: query.name, value: query.value))
            }
            components.queryItems = items
        }
    }
}	
