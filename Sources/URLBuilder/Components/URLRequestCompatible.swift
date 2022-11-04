//
//  URLRequestCompatible.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

public protocol URLRequestCompatible {
    func update(_ request: inout URLRequest)
}
