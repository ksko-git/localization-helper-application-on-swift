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
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        XCTAssertNoThrow(try dict.write(dictionary: dict.getDictionaryResult), "Successfull write.")
        
        XCTAssertNoThrow(try delete.delete(key: "hello", language: "en"), "Successfull delete.")
        
        XCTAssertEqual(output.consoleOutputCallsCount, 2)
        
    }
    
    func testDeleteOptionWithEmptyDictionary() throws {
        
        XCTAssertThrowsError(try delete.delete(key: "hello", language: "en"), "A wordOutOfDictionary Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.wordOutOfDictionary)
         }
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        
    }
    
    func testDeleteOptionWithKKeyOnly() throws {
        
        XCTAssertThrowsError(try delete.delete(key: "hello", language: nil), "A twoParametersForDeleteFunctionExpected Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.twoParametersForDeleteFunctionExpected)
         }
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        
    }
    
    func testDeleteOptionWithLKeyOnly() throws {
        
        XCTAssertThrowsError(try delete.delete(key: nil, language: "en"), "A twoParametersForDeleteFunctionExpected Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.twoParametersForDeleteFunctionExpected)
         }
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        
    }
    
    func testDeleteOptionWithoutArguments() throws {
        
        XCTAssertThrowsError(try delete.delete(key: nil, language: nil), "A twoParametersForDeleteFunctionExpected Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.twoParametersForDeleteFunctionExpected)
         }
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        
    }
    
    static var allTests = [
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys),
        ("testDeleteOptionWithEmptyDictionary", testDeleteOptionWithEmptyDictionary),
        ("testDeleteOptionWithKKeyOnly", testDeleteOptionWithKKeyOnly),
        ("testDeleteOptionWithLKeyOnly", testDeleteOptionWithLKeyOnly),
        ("testDeleteOptionWithoutArguments", testDeleteOptionWithoutArguments)
    ]

}
