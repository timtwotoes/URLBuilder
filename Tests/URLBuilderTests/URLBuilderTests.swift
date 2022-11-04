//
//  URLBuilderTests.swift
//
//
//  Created by Tim Wolff on 19/10/2022.
//

import XCTest
@testable import URLBuilder

final class URLBuilderTests: XCTestCase {
    func testHostValidation() throws {
        XCTAssertEqual(URL {
            Host("http://example.com")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL {
            Host("example.com/Path")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL {
            Host("example.com:80")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL {
            Host("username:password@example.com")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL {
            Host("https://username:password@example.com:80/path")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL {
            Host("http://api.example.com")
        }, URL(string: "https://api.example.com"))
    }
    
    func testPathValidation() throws {
        XCTAssertEqual(URL {
            Host("example.com")
            Path(" /path/ ")
        }, URL(string: "https://example.com/path"))
    }
    
    func testURLComponents() throws {
        XCTAssertEqual(URL {
            Host("example.com")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL {
            Scheme("http")
            Host("example.com")
        }, URL(string: "http://example.com"))

        XCTAssertEqual(URL {
            Scheme("http")
            Authentication(username: "username", password: "password")
            Host("example.com")
        }, URL(string: "http://username:password@example.com"))

        XCTAssertEqual(URL {
            Scheme("http")
            Authentication(username: "username", password: "password")
            Host("example.com")
            Port(80)
        }, URL(string: "http://username:password@example.com:80"))

        XCTAssertEqual(URL {
            Scheme("http")
            Authentication(username: "username", password: "password")
            Host("example.com")
            Port(80)
            Path("path")
        }, URL(string: "http://username:password@example.com:80/path"))

        XCTAssertEqual(URL {
            Scheme("http")
            Authentication(username: "username", password: "password")
            Host("example.com")
            Port(80)
            Path("path")
            Queries {
                Query(name: "lang", value: "en")
            }
        }, URL(string: "http://username:password@example.com:80/path?lang=en"))

        XCTAssertEqual(URL {
            Scheme("http")
            Authentication(username: "username", password: "password")
            Host("example.com")
            Port(80)
            Path("path")
            Queries {
                Query(name: "lang", value: "en")
            }
            Fragment("here")
        }, URL(string: "http://username:password@example.com:80/path?lang=en#here"))

        XCTAssertNil(URL {
            Scheme("https")
        })

    }
}
