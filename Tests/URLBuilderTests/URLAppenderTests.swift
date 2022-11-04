//
//  URLAppenderTests.swift
//  
//
//  Created by Tim Wolff on 25/10/2022.
//

import XCTest
@testable import URLBuilder

public final class URLAppenderTests: XCTestCase {
    private var testURL: URL!
    
    public override func setUpWithError() throws {
        testURL = URL(string: "https://example.com/test?lang=en")
    }
    
    public override func tearDownWithError() throws {
        testURL = nil
    }
    
    func testAllCombinations() throws {
        XCTAssertEqual(testURL.appending {
            Path("configuration")
        }, URL(string: "https://example.com/test/configuration?lang=en"))
        
        XCTAssertEqual(testURL.appending {
            Queries {
                Query(name: "hello", value: "world")
            }
        }, URL(string: "https://example.com/test?lang=en&hello=world"))

        XCTAssertEqual(testURL.appending {
            Path("configuration")
            Queries {
                Query(name: "hello", value: "world")
            }
        }, URL(string: "https://example.com/test/configuration?lang=en&hello=world"))

        XCTAssertEqual(testURL.appending {
            Queries {
                Query(name: "hello", value: "world")
            }
            Path("configuration")
        }, URL(string: "https://example.com/test/configuration?lang=en&hello=world"))
    }
}
