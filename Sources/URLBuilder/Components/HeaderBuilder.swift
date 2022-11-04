//
//  HeaderBuilder.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

@resultBuilder
public enum HeaderBuilder {
    public static func buildBlock(_ fields: Field...) -> [Field] {
        return fields
    }
}
