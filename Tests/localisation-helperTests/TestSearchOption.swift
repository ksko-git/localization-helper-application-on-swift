//
//  TestSearchOption.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import localisation_helper
import XCTest

class TestSearchOption: XCTest {

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
        dict = nil
        output = nil
        super.tearDown()
    }
    
    func testSearchOptionKeyless() {
        
        let result = search.search(key: nil, language: nil)
        
        XCTAssertEqual(result, ValidationResult.SuccessfullSearch)
    }

    func testSearchOptionWithTwoKeys() {
        
        let result = search.search(key: "hello", language: "ru")
        
        XCTAssertEqual(result, ValidationResult.SuccessfullSearch)
    }
    
    func testSearchOptionWithKKey() {
        
        let result = search.search(key: "hello", language: nil)
        
        XCTAssertEqual(result, ValidationResult.SuccessfullSearch)
    }
    
    func testSearchOptionWithLKey() {
        
        let result = search.search(key: nil, language: "ru")
        
        XCTAssertEqual(result, ValidationResult.SuccessfullSearch)
    }
    
    
    static var allTests = [
        ("testSearchOptionKeyless", testSearchOptionKeyless),
        ("testSearchOptionWithTwoKeys", testSearchOptionWithTwoKeys),
        ("testSearchOptionWithKKey", testSearchOptionWithKKey),
        ("testSearchOptionWithLKey", testSearchOptionWithLKey)
    ]

}
