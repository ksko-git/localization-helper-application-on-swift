//
//  TestUpdateOption.swift
//  
//
//  Created by Ксюся on 20.11.2020.
//

@testable import localisation_helper
import XCTest

final class TestUpdateOption: XCTestCase {

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
    
    func testUpdateOptionWithTwoKeys() throws {
        do {
            try update.update(newWord: "hi", key: "hello", language: "en")
        } catch let error as ValidationResult {
            XCTFail(error.errorDescription)
        }
    }
    
    func testUpdateOptionWithEmptyArguments() throws {
        do {
            try update.update(newWord: "", key: "", language: "")
        } catch let error as ValidationResult {
            XCTFail(error.errorDescription)
        }
    }
    
    static var allTests = [
        ("testUpdateOptionWithTwoKeys", testUpdateOptionWithTwoKeys),
        ("testUpdateOptionWithEmptyArguments", testUpdateOptionWithEmptyArguments)
    ]

}
