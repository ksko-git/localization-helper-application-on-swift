//
//  TestArgumentParser.swift
//
//
//  Created by Ксюся on 17.11.2020.
//

@testable import localisation_helper
import XCTest

class TestArgumentParser: XCTestCase {
    
    var argumentsParser: ArgumentsParser!

    override func setUp() {
        super.setUp()
        argumentsParser = ArgumentsParser()
    }
    override func tearDown() {
        argumentsParser = nil
        super.tearDown()
    }

    func testSearchOptionWithTwoKeys() throws {
        
        let arguments = argumentsParser.parse(["search", "-k", "day", "-l", "pt"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, "day")
                XCTAssertEqual(language, "pt")

            default:
                XCTFail()
            }

    }
    
    func testSearchOptionWithKKey() throws {
        
        let arguments = argumentsParser.parse(["search", "-k", "day"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, "day")
                XCTAssertEqual(language, nil)

            default:
                XCTFail()
            }

    }
    
    func testSearchOptionWithLKey() throws {
        
        let arguments = argumentsParser.parse(["search", "-l", "pt"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, "pt")

            default:
                XCTFail()
            }

    }
    
    func testSearchOptionWithTwoNils() throws {
        
        let arguments = argumentsParser.parse(["search"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, nil)

            default:
                XCTFail()
            }

    }
    
    func testUdpateOptionWithTwoKeys() throws {
        
        let arguments = argumentsParser.parse(["update", "hi", "-k", "hello", "-l", "en"])

        switch arguments {
            case .update(let word, let key, let language):
                XCTAssertEqual(word, "hi")
                XCTAssertEqual(key, "hello")
                XCTAssertEqual(language, "en")

            default:
                XCTFail()
            }

    }
    
    func testDeleteOptionWithTwoKeys() throws {
        
        let arguments = argumentsParser.parse(["delete", "-k", "hello", "-l", "en"])

        switch arguments {
            case .delete(let key, let language):
                XCTAssertEqual(key, "hello")
                XCTAssertEqual(language, "en")

            default:
                XCTFail()
            }

    }
    
    static var allTests = [
        ("testSearchOptionWithTwoKeys", testSearchOptionWithTwoKeys),
        ("testSearchOptionWithKKey", testSearchOptionWithKKey),
        ("testSearchOptionWithLKey", testSearchOptionWithLKey),
        ("testSearchOptionWithTwoNils", testSearchOptionWithTwoNils),
        ("testUdpateOptionWithTwoKeys", testUdpateOptionWithTwoKeys),
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys)
    ]

    
}
