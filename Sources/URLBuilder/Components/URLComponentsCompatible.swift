//
//  URLComponentsCompatible.swift
//  
//
//  Created by Tim on 25/10/2022.
//

import Foundation

/// An instance conforming to this protocol can describe itself through, at least, one of URLComponents properties.
public protocol URLComponentsCompatible {
    
    /// Implementor of this method should update the URLComponents properties that it represents.
    /// - Parameter components: components of an URL
    func update(_ components: inout URLComponents)
}
