//
//  URLRequestBuilderTests.swift
//  
//
//  Created by Tim Wolff on 29/10/2022.
//

import XCTest
@testable import URLBuilder

final class URLRequestBuilderTests: XCTestCase {
    private var testURL: URL!
    
    private func createURLRequest(cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60.0, method: String? = nil, headerFields: [(name: String, value: String)]? = nil, shouldAddFields: Bool = false) -> URLRequest {
        var request = URLRequest(url: testURL, cachePolicy: cachePolicy, timeoutInterval: timeout)
        
        if let method {
            request.httpMethod = method
        }

        if let headerFields {
            for field in headerFields {
                if shouldAddFields {
                    request.addValue(field.value, forHTTPHeaderField: field.name)
                } else {
                    request.setValue(field.value, forHTTPHeaderField: field.name)
                }
            }
        }
        
        return request
    }
    
    override func setUpWithError() throws {
        testURL = URL(string: "https://example.com")
    }
    
    override func tearDownWithError() throws {
        testURL = nil
    }
    
    func testComponents() throws {
        XCTAssertEqual(URLRequest {
            testURL!
        }, createURLRequest())
        
        XCTAssertEqual(URLRequest(cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0) {
            testURL!
        }, createURLRequest(cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeout: 10.0))
        
        XCTAssertEqual(URLRequest {
            testURL!
            Method("UPDATE")
        }, createURLRequest(method: "UPDATE"))
        
        XCTAssertEqual(URLRequest {
            testURL!
            Header {
                Field(name: "test", value: "data")
                Field(name: "test", value: "hello")
            }
        }, createURLRequest(headerFields: [("test", "hello")]))
        
        XCTAssertEqual(URLRequest {
            testURL!
            Header(mode: .add) {
                Field(name: "test", value: "data")
                Field(name: "test", value: "hello")
            }
        }, createURLRequest(headerFields: [("test", "data"), ("test", "hello")], shouldAddFields: true))
    }
}
