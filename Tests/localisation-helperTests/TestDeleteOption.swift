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

//    func testDeleteOptionWithTwoKeys() {
//
//        let result = delete.delete(key: "hello", language: "en")
//
//        XCTAssertEqual(result, ValidationResult.success)
//    }
    
//    func testDeleteOptionWithOneKey() {
//
//        let expectedError = ValidationResult.onlyOneParameterEnteredToDelete
//
//        let result = delete.delete(key: "hello", language: nil)
//
//        XCTAssertEqual(result, expectedError)
//        XCTAssertTrue(true, expectedError.errorDescription!)
//    }
    
//    func testDeleteOptionWithNoDictionary() {
//
//        let expectedError = ValidationResult.dictionaryIsEmpty
//
//        let result = delete.delete(key: "hello", language: nil)
//
//        if dict.getDictionary().isEmpty {
//            XCTFail(expectedError.errorDescription!)
//        }
//
//        XCTAssertEqual(result, ValidationResult.success)
//    }
    
//    static var allTests = [
//        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys),
//        ("testDeleteOptionWithOneKey", testDeleteOptionWithOneKey),
//        ("testDeleteOptionWithNoDictionary", testDeleteOptionWithNoDictionary)
//    ]

}
