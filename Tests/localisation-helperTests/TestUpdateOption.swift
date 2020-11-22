//
//  TestUpdateOption.swift
//  
//
//  Created by Ксюся on 20.11.2020.
//

@testable import localisation_helper
import XCTest

class TestUpdateOption: XCTest {

    var update: Update!

    var dict: MockDictionary!
    var output: MockTerminalOutput!

    override func setUp() {
        super.setUp()
        dict = MockDictionary()
        output = MockTerminalOutput()
        update = Update(dictionary: dict, terminalOutput: output)
    }

    override func tearDown() {
        update = nil
        dict = nil
        output = nil
        super.tearDown()
    }
    
    func testDeleteOptionWithTwoKeys() {
        
        let result = update.update(newWord: "hi", key: "hello", language: "en")
        
        XCTAssertEqual(result, ValidationResult.success)
    }
    
    func testUpdateOptionWithNoDictionary() {
        
        let expectedError = ValidationResult.dictionaryIsEmpty
        
        let result = update.update(newWord: "hi", key: "hello", language: "en")
        
        if dict.getDictionary().isEmpty {
            XCTFail(expectedError.errorDescription!)
        }
        
        XCTAssertEqual(result, ValidationResult.success)
    }
    
    static var allTests = [
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys),
        ("testUpdateOptionWithNoDictionary", testUpdateOptionWithNoDictionary)
    ]

}
