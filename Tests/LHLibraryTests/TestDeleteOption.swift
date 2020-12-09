//
//  TestDeleteOption.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import LHLibrary
import XCTest

final class TestDeleteOption: XCTestCase {

    var delete: Delete!

    var dict: MockDictionary!
    var thrownError: ValidationResult?

    override func setUp() {
        super.setUp()
        dict = MockDictionary()
        delete = Delete(dictionary: dict)
    }

    override func tearDown() {
        delete = nil
        dict = nil
        super.tearDown()
    }

    func testDeleteOptionWithTwoKeys() throws {
        
        XCTAssertNoThrow(dict.getDictionary(), "Dictionary received.")
        dict.getDictionaryResult = ["hello": ["en": "hello"]]
        XCTAssertEqual(dict.getDictionary(), ["hello": ["en": "hello"]])
        XCTAssertNoThrow(dict.write(dictionary: dict.getDictionaryResult), "Successfull write.")
        
        XCTAssertNoThrow(delete.delete(key: "hello", language: "en"), "Successfull delete.")
    }
    
    static var allTests = [
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys)
    ]

}
