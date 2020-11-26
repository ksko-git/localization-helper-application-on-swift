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
        
        XCTAssertNoThrow(try dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(try dict.getDictionary(), ["hello": ["en": "hello"]])
        XCTAssertNoThrow(try dict.write(dictionary: dict.getDictionaryResult), "Successfull write.")
        
        XCTAssertNoThrow(try update.update(newWord: "hi", key: "hello", language: "en"), "Successfull delete.")
        
        XCTAssertEqual(output.consoleOutputCallsCount, 2)
        
    }
    
    func testUpdateOptionWithWordOutOfDictionary() throws {
        
        XCTAssertThrowsError(try update.update(newWord: "hi", key: "hello", language: "en"), "A wordOutOfDictionary Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.wordOutOfDictionary)
         }
        
        XCTAssertEqual(output.consoleOutputCallsCount, 0)
        
    }
    
    static var allTests = [
        ("testUpdateOptionWithTwoKeys", testUpdateOptionWithTwoKeys),
        ("testUpdateOptionWithWordOutOfDictionary", testUpdateOptionWithWordOutOfDictionary)
    ]

}
