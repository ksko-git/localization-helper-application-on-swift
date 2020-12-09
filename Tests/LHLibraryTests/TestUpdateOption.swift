//
//  TestUpdateOption.swift
//  
//
//  Created by Ксюся on 20.11.2020.
//

@testable import LHLibrary
import XCTest

final class TestUpdateOption: XCTestCase {

    var update: Update!

    var dict: MockDictionary!
    var output: MockTerminalOutput!

    override func setUp() {
        super.setUp()
        dict = MockDictionary()
        output = MockTerminalOutput()
        update = Update(dictionary: dict)
    }

    override func tearDown() {
        update = nil
        dict = nil
        output = nil
        super.tearDown()
    }
    
    func testUpdateOptionWithTwoKeys() throws {
        
        XCTAssertNoThrow(dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        XCTAssertNoThrow(dict.write(dictionary: dict.getDictionaryResult), "Successfull write.")
        
        XCTAssertNoThrow(update.update(newWord: "hi", key: "hello", language: "en"), "Successfull delete.")
        
    }
    
    static var allTests = [
        ("testUpdateOptionWithTwoKeys", testUpdateOptionWithTwoKeys)
    ]

}
