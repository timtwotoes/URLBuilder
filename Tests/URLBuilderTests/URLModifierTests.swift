//
//  URLModifierTests.swift
//  
//
//  Created by Tim on 24/10/2022.
//

import XCTest
@testable import URLBuilder

final class URLModifierTests: XCTestCase {
    private var testURL: URL!
    
    override func setUpWithError() throws {
        testURL = URL(string: "https://username:password@example.com:80/path?lang=en#here")!
    }
    
    override func tearDownWithError() throws {
        testURL = nil
    }
    
    func testSingleCombination() throws {
        XCTAssertEqual(testURL.modified {
            Scheme("http")
        }, URL(string: "http://username:password@example.com:80/path?lang=en#here"))
        
        XCTAssertEqual(testURL.modified {
            Auth(username: "john", password: "doe")
        }, URL(string: "https://john:doe@example.com:80/path?lang=en#here"))

        XCTAssertEqual(testURL.modified {
            Host("test.com")
        }, URL(string: "https://username:password@test.com:80/path?lang=en#here"))

        XCTAssertEqual(testURL.modified {
            Port(120)
        }, URL(string: "https://username:password@example.com:120/path?lang=en#here"))

        XCTAssertEqual(testURL.modified {
            Path("content")
        }, URL(string: "https://username:password@example.com:80/content?lang=en#here"))

        XCTAssertEqual(testURL.modified {
            Queries {
                Query(name: "hello", value: "world")
            }
        }, URL(string: "https://username:password@example.com:80/path?hello=world#here"))

        XCTAssertEqual(testURL.modified {
            Fragment("nowhere")
        }, URL(string: "https://username:password@example.com:80/path?lang=en#nowhere"))

        XCTAssertEqual(testURL.modified {
            
        }, URL(string: "https://username:password@example.com:80/path?lang=en#here"))

    }
}
