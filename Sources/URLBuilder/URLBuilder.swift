//
//  Scheme.swift
//
//
//  Created by Tim on 19/10/2022.
//

import Foundation

@resultBuilder
public enum URLBuilder {
    private static let defaultScheme = "https"
    
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
    
    public static func buildBlock(_ objects: URLComponentsCompatible...) -> URL? {
        var components = URLComponents()
        for object in objects {
            object.update(&components)
        }
        
        if components.scheme == nil {
            components.scheme = defaultScheme
        }
        
        return components.host == nil ? nil : components.url
    }
    
//    public static func buildBlock() -> URL? {
//        return nil
//    }
//
//    // MARK: One Combinations
//
//    public static func buildBlock(_ host: Host) -> URL? {
//        return build(host: host)
//    }
//
//    // MARK: Two Combinations
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host) -> URL? {
//        return build(scheme: scheme, host: host)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host) -> URL? {
//        return build(host: host, authentication: authentication)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port) -> URL? {
//        return build(host: host, port: port)
//    }
//
//    public static func buildBlock(_ host: Host, _ path: Path) -> URL? {
//        return build(host: host, path: path)
//    }
//
//    public static func buildBlock(_ host: Host, _ queries: Queries) -> URL? {
//        return build(host: host, queries: queries)
//    }
//
//    public static func buildBlock(_ host: Host, _ fragment: Fragment) -> URL? {
//        return build(host: host, fragment: fragment)
//    }
//
//    // MARK: Three Combinations
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host) -> URL? {
//        return build(scheme: scheme, host: host, authentication: authentication)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ port: Port) -> URL? {
//        return build(scheme: scheme, host: host, port: port)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ path: Path) -> URL? {
//        return build(scheme: scheme, host: host, path: path)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, fragment: fragment)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ port: Port) -> URL? {
//        return build(host: host, port: port, authentication: authentication)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ path: Path) -> URL? {
//        return build(host: host, authentication: authentication, path: path)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ queries: Queries) -> URL? {
//        return build(host: host, authentication: authentication, queries: queries)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ fragment: Fragment) -> URL? {
//        return build(host: host, authentication: authentication, fragment: fragment)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port, _ path: Path) -> URL? {
//        return build(host: host, port: port, path: path)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port, _ queries: Queries) -> URL? {
//        return build(host: host, port: port, queries: queries)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port, _ fragment: Fragment) -> URL? {
//        return build(host: host, port: port, fragment: fragment)
//    }
//
//    public static func buildBlock(_ host: Host, _ path: Path, _ queries: Queries) -> URL? {
//        return build(host: host, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ host: Host, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(host: host, path: path, fragment: fragment)
//    }
//
//    // MARK: Four Combinations
//
//    public static func buildBlock(_ scheme: Scheme, _ authentiation: Auth, _ host: Host, _ port: Port) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentiation)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ path: Path) -> URL? {
//        return build(scheme: scheme, host: host, authentication: authentication, path: path)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, authentication: authentication, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, authentication: authentication, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ port: Port, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, port: port, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ port: Port, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ path: Path, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, path: path, fragment: fragment)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ port: Port, _ path: Path) -> URL? {
//        return build(host: host, port: port, authentication: authentication, path: path)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ port: Port, _ queries: Queries) -> URL? {
//        return build(host: host, port: port, authentication: authentication, queries: queries)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ port: Port, _ fragment: Fragment) -> URL? {
//        return build(host: host, port: port, authentication: authentication, fragment: fragment)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ path: Path, _ queries: Queries) -> URL? {
//        return build(host: host, authentication: authentication, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(host: host, authentication: authentication, path: path, fragment: fragment)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port, _ path: Path, _ queries: Queries) -> URL? {
//        return build(host: host, port: port, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(host: host, port: port, path: path, fragment: fragment)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(host: host, port: port, queries: queries, fragment: fragment)
//    }
//
//    public static func buildBlock(_ host: Host, _ path: Path, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(host: host, path: path, queries: queries, fragment: fragment)
//    }
//
//
//
//    // MARK: Five Combinations
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ port: Port, _ path: Path) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentication, path: path)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ port: Port, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentication, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ port: Port, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentication, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ path: Path, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, authentication: authentication, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, authentication: authentication, path: path, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ port: Port, _ path: Path, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, port: port, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ port: Port, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, path: path, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ path: Path, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, path: path, queries: queries, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ port: Port, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, queries: queries, fragment: fragment)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ port: Port, _ path: Path, _ queries: Queries) -> URL? {
//        return build(host: host, port: port, authentication: authentication, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ port: Port, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(host: host, port: port, authentication: authentication, path: path, fragment: fragment)
//    }
//
//    public static func buildBlock(_ host: Host, _ port: Port, _ path: Path, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(host: host, port: port, path: path, queries: queries, fragment: fragment)
//    }
//
//    // MARK: Six Combinations
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ port: Port, _ path: Path, _ queries: Queries) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentication, path: path, queries: queries)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ port: Port, _ path: Path, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentication, path: path, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ path: Path, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, authentication: authentication, path: path, queries: queries, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ port: Port, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentication, queries: queries, fragment: fragment)
//    }
//
//    public static func buildBlock(_ scheme: Scheme, _ host: Host, _ port: Port, _ path: Path, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, path: path, queries: queries, fragment: fragment)
//    }
//
//
//    public static func buildBlock(_ authentication: Auth, _ host: Host, _ port: Port, _ path: Path, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(host: host, port: port, authentication: authentication, path: path, queries: queries, fragment: fragment)
//    }
//
//
//    // MARK: Seven Combinatins
//
//    public static func buildBlock(_ scheme: Scheme, _ authentication: Auth, _ host: Host, _ port: Port, _ path: Path, _ queries: Queries, _ fragment: Fragment) -> URL? {
//        return build(scheme: scheme, host: host, port: port, authentication: authentication, path: path, queries: queries, fragment: fragment)
//    }
    
//    private static func build(scheme: Scheme = defaultScheme, host: Host, port: Port? = nil, authentication: Auth? = nil, path: Path? = nil, queries: Queries? = nil, fragment: Fragment? = nil) -> URL? {
//        var components = URLComponents()
//        components.scheme = scheme.value
//        components.host = host.name
//        components.port = port?.value
//        components.user = authentication?.username
//        components.password = authentication?.password
//        components.fragment = fragment?.value
//
//        if let path {
//            components.path = path.value
//        }
//
//        if let queries {
//            if !queries.queries.isEmpty {
//                var queryItems = [URLQueryItem]()
//                for query in queries.queries {
//                    queryItems.append(URLQueryItem(name: query.name, value: query.value))
//                }
//                components.queryItems = queryItems
//            }
//        }
//
//        return components.url
//    }
    
    
}

extension URL {
    public static func build(@URLBuilder _ content: () -> URL?) -> URL? {
        return content()
    }
}
