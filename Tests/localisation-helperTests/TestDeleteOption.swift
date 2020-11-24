//
//  TestDeleteOption.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import localisation_helper
import XCTest

final class TestDeleteOption: XCTestCase {

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
        delete = nil
        dict = nil
        output = nil        
        super.tearDown()
    }

    func testDeleteOptionWithTwoKeys() throws {
        do {
            try delete.delete(key: "hello", language: "en")
        } catch let error as ValidationResult {
            XCTFail(error.errorDescription)
        }
    }
    
    func testDeleteOptionWithKKeyOnly() throws {
        do {
            try delete.delete(key: "hello", language: nil)
        } catch let error as ValidationResult {
            if error != ValidationResult.onlyOneParameterEnteredToDelete {
                XCTFail("No error message is issued!")
            }
            
        }
    }
    
    func testDeleteOptionWithLKeyOnly() throws {
        do {
            try delete.delete(key: nil, language: "ru")
        } catch let error as ValidationResult {
            if error != ValidationResult.onlyOneParameterEnteredToDelete {
                XCTFail("No error message is issued!")
            }
            
        }
    }
    
    static var allTests = [
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys),
        ("testDeleteOptionWithKKeyOnly", testDeleteOptionWithKKeyOnly),
        ("testDeleteOptionWithLKeyOnly", testDeleteOptionWithLKeyOnly)
    ]

}
