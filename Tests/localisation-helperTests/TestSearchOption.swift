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
    
    func testSearchOptionKeyless() throws {
        
        do {
            try search.search(key: nil, language: nil)
        } catch let error as ValidationResult {
            XCTFail(error.errorDescription)
        }
        
//        let result = search.search(key: nil, language: nil)
//
//        XCTAssertEqual(result, ValidationResult.success)
    }

//    func testSearchOptionWithTwoKeys() {
//
//        let result = search.search(key: "hello", language: "ru")
//
//        XCTAssertEqual(result, ValidationResult.success)
//    }
//
//    func testSearchOptionWithKKey() {
//
//        let result = search.search(key: "hello", language: nil)
//
//        XCTAssertEqual(result, ValidationResult.success)
//    }
//
//    func testSearchOptionWithLKey() {
//
//        let result = search.search(key: nil, language: "ru")
//
//        XCTAssertEqual(result, ValidationResult.success)
//    }
    
    static var allTests = [
        ("testSearchOptionKeyless", testSearchOptionKeyless),
//        ("testSearchOptionWithTwoKeys", testSearchOptionWithTwoKeys),
//        ("testSearchOptionWithKKey", testSearchOptionWithKKey),
//        ("testSearchOptionWithLKey", testSearchOptionWithLKey)
    ]

}
