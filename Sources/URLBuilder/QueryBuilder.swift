//
//  QueryBuilder.swift
//  
//
//  Created by Tim on 23/10/2022.
//

import Foundation

@resultBuilder
public enum QueryBuilder {
    public static func buildBlock(_ queries: Query...) -> [Query] {
        return queries
    }
}
