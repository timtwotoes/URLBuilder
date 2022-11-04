//
//  URLRequestBuilder.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import Foundation

@resultBuilder
public enum URLRequestBuilder {
    @available(*, unavailable, message: "First parameter must be an URL and is required")
    public static func buildBlock(_ components: URLRequestCompatible...) -> URLRequest {
        fatalError("First parameter must be an URL and is required")
    }
    
    public static func buildBlock(_ url: URL) -> URLRequest {
        return URLRequest(url: url)
    }
    
    public static func buildBlock(_ url: URL, _ components: URLRequestCompatible...) -> URLRequest {
        var request = URLRequest(url: url)
        
        for component in components {
            component.update(&request)
        }
        
        return request
    }
}

extension URLRequest {
    public init(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 60.0, @URLRequestBuilder _ builder: () -> URLRequest) {
        var request = builder()
        request.cachePolicy = cachePolicy
        request.timeoutInterval = timeoutInterval
        self = request
    }
}
