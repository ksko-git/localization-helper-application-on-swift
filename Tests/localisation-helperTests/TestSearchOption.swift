//
//  TestSearchOption.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import localisation_helper
import XCTest

final class TestSearchOption: XCTestCase {

    var search: Search!

    var dict: MockDictionary!
    var output: MockTerminalOutput!

    override func setUp() {
        super.setUp()
        dict = MockDictionary()
        output = MockTerminalOutput()
        search = Search(dictionary: dict, terminalOutput: output)
    }

    override func tearDown() {
        search = nil
        dict = nil
        output = nil
        super.tearDown()
    }
    
    func testSearchOptionWithoutKeys() throws {
        
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        // проверка того, что функции не вызывались в search
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        XCTAssertEqual(output.outputTemplatesCallsCount, 0)
        
        XCTAssertNoThrow(try search.search(key: nil, language: nil))
        // но вызывались в defaultSearch
        XCTAssertEqual(output.consoleOutputCallsCount, 1)
        XCTAssertEqual(output.outputTemplatesCallsCount, 1)
        
    }

    func testSearchOptionWithTwoKeys() throws {
        
        XCTAssertNoThrow(try dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(try search.search(key: "hello", language: "en"))
        
        XCTAssertEqual(output.consoleOutputCallsCount, 1)
        XCTAssertEqual(output.outputTemplatesCallsCount, 0)
        
    }

    func testSearchOptionWithKKey() throws {
        
        XCTAssertNoThrow(try dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(try search.search(key: "hello", language: nil))
        
        XCTAssertEqual(output.consoleOutputCallsCount, 1)
        XCTAssertEqual(output.outputTemplatesCallsCount, 1)
        
    }

    func testSearchOptionWithLKey() throws {
        
        XCTAssertNoThrow(try dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(try search.search(key: nil, language: "en"))
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        XCTAssertEqual(output.outputTemplatesCallsCount, 1)

    }
    
    func testSearchOptionWithWrongKKey() throws {
        
        XCTAssertNoThrow(try dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(try search.search(key: "cat", language: "en"))
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        XCTAssertEqual(output.outputTemplatesCallsCount, 0)
        XCTAssertEqual(output.outputNotFoundCallsCount, 1)

    }
    
    func testSearchOptionWithWrongLKey() throws {
        
        XCTAssertNoThrow(try dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        
        XCTAssertNoThrow(try search.search(key: "hello", language: "ru"))
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        XCTAssertEqual(output.outputTemplatesCallsCount, 0)
        XCTAssertEqual(output.outputNotFoundCallsCount, 1)

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
