//
//  TestSearchOption.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import App
import XCTest

final class TestSearchOption: XCTestCase {

    var search: Search!

    var dict: MockDictionary!

    override func setUp() {
        super.setUp()
        dict = MockDictionary()
        search = Search(dictionary: dict)
    }

    override func tearDown() {
        search = nil
        dict = nil
        super.tearDown()
    }
    
    func testSearchOptionWithoutKeys() throws {
        
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(search.search(key: nil, language: nil))
    }

    func testSearchOptionWithTwoKeys() throws {
        
        XCTAssertNoThrow(dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(search.search(key: "hello", language: "en"))
    }

    func testSearchOptionWithKKey() throws {
        
        XCTAssertNoThrow(dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(search.search(key: "hello", language: nil))
    }

    func testSearchOptionWithLKey() throws {
        
        XCTAssertNoThrow(dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(search.search(key: nil, language: "en"))
    }
    
    func testSearchOptionWithWrongKKey() throws {
        
        XCTAssertNoThrow(dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(search.search(key: "cat", language: "en"))
    }
    
    func testSearchOptionWithWrongLKey() throws {
        
        XCTAssertNoThrow(dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(search.search(key: "hello", language: "ru"))
    }
    
    static var allTests = [
        ("testSearchOptionWithoutKeys", testSearchOptionWithoutKeys),
        ("testSearchOptionWithTwoKeys", testSearchOptionWithTwoKeys),
        ("testSearchOptionWithKKey", testSearchOptionWithKKey),
        ("testSearchOptionWithLKey", testSearchOptionWithLKey),
        ("testSearchOptionWithWrongKKey", testSearchOptionWithWrongKKey),
        ("testSearchOptionWithWrongLKey", testSearchOptionWithWrongLKey),
    ]

}
