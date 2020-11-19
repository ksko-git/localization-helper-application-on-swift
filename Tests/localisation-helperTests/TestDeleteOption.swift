//
//  TestDeleteOption.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import localisation_helper
import XCTest

class TestDeleteOption: XCTest {

    var delete: Delete!

    var dict: MockDictionary!
    var output: MockTerminalOutput!

    override func setUp() {
        super.setUp()
        dict = MockDictionary()
        output = MockTerminalOutput()
        delete = Delete(dictionary: dict, terminalOutput: output)
    }

    override func tearDown() {
        dict = nil
        output = nil
        super.tearDown()
    }

    func testDeleteOptionWithTwoKeys() {
        
        let result = delete.delete(key: "hello", language: "ru")
        
        XCTAssertEqual(result, ValidationResult.SuccessfullSearch)
    }
    
    
    static var allTests = [
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys)
    ]

}
