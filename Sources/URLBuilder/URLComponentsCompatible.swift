//
//  URLComponentsCompatible.swift
//  
//
//  Created by Tim on 25/10/2022.
//

import Foundation

public protocol URLComponentsCompatible {
    func update(_ components: inout URLComponents)
}
