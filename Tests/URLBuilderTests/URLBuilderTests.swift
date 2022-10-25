//
//  URLBuilderTests.swift
//
//
//  Created by Tim on 19/10/2022.
//

import XCTest
@testable import URLBuilder

final class URLBuilderTests: XCTestCase {
    func testHostValidation() throws {
        XCTAssertEqual(URL.build {
            Host("http://example.com")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL.build {
            Host("example.com/Path")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL.build {
            Host("example.com:80")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL.build {
            Host("username:password@example.com")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL.build {
            Host("https://username:password@example.com:80/path")
        }, URL(string: "https://example.com"))
    }
    
    func testPathValidation() throws {
        XCTAssertEqual(URL.build {
            Host("example.com")
            Path(" /path/ ")
        }, URL(string: "https://example.com/path"))
    }
    
    func testURLComponents() throws {
        XCTAssertEqual(URL.build {
            Host("example.com")
        }, URL(string: "https://example.com"))
        
        XCTAssertEqual(URL.build {
            Scheme("http")
            Host("example.com")
        }, URL(string: "http://example.com"))

        XCTAssertEqual(URL.build {
            Scheme("http")
            Auth(username: "username", password: "password")
            Host("example.com")
        }, URL(string: "http://username:password@example.com"))

        XCTAssertEqual(URL.build {
            Scheme("http")
            Auth(username: "username", password: "password")
            Host("example.com")
            Port(80)
        }, URL(string: "http://username:password@example.com:80"))

        XCTAssertEqual(URL.build {
            Scheme("http")
            Auth(username: "username", password: "password")
            Host("example.com")
            Port(80)
            Path("path")
        }, URL(string: "http://username:password@example.com:80/path"))

        XCTAssertEqual(URL.build {
            Scheme("http")
            Auth(username: "username", password: "password")
            Host("example.com")
            Port(80)
            Path("path")
            Queries {
                Query(name: "lang", value: "en")
            }
        }, URL(string: "http://username:password@example.com:80/path?lang=en"))

        XCTAssertEqual(URL.build {
            Scheme("http")
            Auth(username: "username", password: "password")
            Host("example.com")
            Port(80)
            Path("path")
            Queries {
                Query(name: "lang", value: "en")
            }
            Fragment("here")
        }, URL(string: "http://username:password@example.com:80/path?lang=en#here"))

        XCTAssertNil(URL.build {
            Scheme("https")
        })

    }
    
//    func testURLBuilderTwoCombinations() throws {
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//        }, URL(string: "http://example.com"))
//        
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//        }, URL(string: "https://username:password@example.com"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//        }, URL(string: "https://example.com:80"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Path("path")
//        }, URL(string: "https://example.com/path"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Queries {
//                Query(name: "lang", value: "en")
//                Query(name: "test")
//            }
//        }, URL(string: "https://example.com?lang=en&test"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Fragment("here")
//        }, URL(string: "https://example.com#here"))
//    }
//    
//    func testURLBuilderThreeCombinations() throws {
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//        }, URL(string: "http://username:password@example.com"))
//        
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Port(80)
//        }, URL(string: "http://example.com:80"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Path("path")
//        }, URL(string: "http://example.com/path"))
//        
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Queries {
//                Query(name: "lang", value: "en")
//                Query(name: "test")
//            }
//        }, URL(string: "http://example.com?lang=en&test"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Fragment("here")
//        }, URL(string: "http://example.com#here"))
//        
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//        }, URL(string: "https://username:password@example.com:80"))
//
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Path("path")
//        }, URL(string: "https://username:password@example.com/path"))
//        
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "https://username:password@example.com?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Fragment("here")
//        }, URL(string: "https://username:password@example.com#here"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//            Path("path")
//        }, URL(string: "https://example.com:80/path"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "https://example.com:80?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//            Fragment("here")
//        }, URL(string: "https://example.com:80#here"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "https://example.com/path?lang=en"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Path("path")
//            Fragment("here")
//        }, URL(string: "https://example.com/path#here"))
//    }
//    
//    func testURLBuilderFourCombinations() throws {
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//        }, URL(string: "http://username:password@example.com:80"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Path("path")
//        }, URL(string: "http://username:password@example.com/path"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "http://username:password@example.com?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Fragment("here")
//        }, URL(string: "http://username:password@example.com#here"))
//        
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Port(80)
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "http://example.com:80?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Port(80)
//            Fragment("here")
//        }, URL(string: "http://example.com:80#here"))
//        
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "http://example.com/path?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Path("path")
//            Fragment("here")
//        }, URL(string: "http://example.com/path#here"))
//        
//
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//        }, URL(string: "https://username:password@example.com:80/path"))
//        
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "https://username:password@example.com:80?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Fragment("here")
//        }, URL(string: "https://username:password@example.com:80#here"))
//        
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "https://username:password@example.com/path?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Path("path")
//            Fragment("here")
//        }, URL(string: "https://username:password@example.com/path#here"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "https://example.com:80/path?lang=en"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Fragment("here")
//        }, URL(string: "https://example.com:80/path#here"))
//
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "https://example.com:80?lang=en#here"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "https://example.com/path?lang=en#here"))
//    }
//    
//    func testURLBuilderFiveCombinations() {
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//        }, URL(string: "http://username:password@example.com:80/path"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "http://username:password@example.com:80?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Fragment("here")
//        }, URL(string: "http://username:password@example.com:80#here"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "http://username:password@example.com/path?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Path("path")
//            Fragment("here")
//        }, URL(string: "http://username:password@example.com/path#here"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "http://example.com:80/path?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Fragment("here")
//        }, URL(string: "http://example.com:80/path#here"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "http://example.com/path?lang=en#here"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Port(80)
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "http://example.com:80?lang=en#here"))
//
//        
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "https://username:password@example.com:80/path?lang=en"))
//
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Fragment("here")
//        }, URL(string: "https://username:password@example.com:80/path#here"))
//        
//        XCTAssertEqual(URL.build {
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "https://example.com:80/path?lang=en#here"))
//    }
//    
//    func testURLBuilderSixCombinations() throws {
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//        }, URL(string: "http://username:password@example.com:80/path?lang=en"))
//        
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Fragment("here")
//        }, URL(string: "http://username:password@example.com:80/path#here"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "http://username:password@example.com/path?lang=en#here"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "http://username:password@example.com:80?lang=en#here"))
//
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "http://example.com:80/path?lang=en#here"))
//        
//        XCTAssertEqual(URL.build {
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "https://username:password@example.com:80/path?lang=en#here"))
//    }
//    
//    func testURLBuilderSevenCombinations() throws {
//        XCTAssertEqual(URL.build {
//            Scheme("http")
//            Auth(username: "username", password: "password")
//            Host("example.com")
//            Port(80)
//            Path("path")
//            Queries {
//                Query(name: "lang", value: "en")
//            }
//            Fragment("here")
//        }, URL(string: "http://username:password@example.com:80/path?lang=en#here"))
//    }
}
