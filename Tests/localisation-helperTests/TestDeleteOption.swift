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
    var thrownError: ValidationResult?

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
        
        XCTAssertNoThrow(try dict.getDictionary(), "Dictionary received.")
        
    }
    
    func testDeleteOptionWithEmptyDictionary() throws {
        
        XCTAssertThrowsError(try delete.delete(key: "hello", language: "en"), "A wordOutOfDictionary Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.wordOutOfDictionary)
         }
        
    }
    
    func testDeleteOptionWithKKeyOnly() throws {
        
        XCTAssertThrowsError(try delete.delete(key: "hello", language: nil), "A twoParametersForDeleteFunctionExpected Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.twoParametersForDeleteFunctionExpected)
         }
        
    }
    
    func testDeleteOptionWithLKeyOnly() throws {
        
        XCTAssertThrowsError(try delete.delete(key: nil, language: "en"), "A twoParametersForDeleteFunctionExpected Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.twoParametersForDeleteFunctionExpected)
         }
        
    }
    
    func testDeleteOptionWithoutArguments() throws {
        
        XCTAssertThrowsError(try delete.delete(key: nil, language: nil), "A twoParametersForDeleteFunctionExpected Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.twoParametersForDeleteFunctionExpected)
         }
        
    }
    
    static var allTests = [
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys),
        ("testDeleteOptionWithKKeyOnly", testDeleteOptionWithKKeyOnly),
        ("testDeleteOptionWithLKeyOnly", testDeleteOptionWithLKeyOnly),
        ("testDeleteOptionWithoutArguments", testDeleteOptionWithoutArguments)
    ]

}
