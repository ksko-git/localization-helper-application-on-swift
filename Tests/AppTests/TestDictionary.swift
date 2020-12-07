//
//  TestDictionary.swift
//  
//
//  Created by Ксюся on 23.11.2020.
//

@testable import App
import XCTest

final class TestDictionary: XCTestCase {

    var dictionary: Dictionary!
    var error: ValidationResult!

    override func setUp() {
        super.setUp()
        dictionary = Dictionary()
    }

    override func tearDown() {
        dictionary = nil
        super.tearDown()
    }
    
    func testGetDictionary() throws {
        
        XCTAssertNoThrow(dictionary.getDictionary(), "Dictionary successfully received.")

    }
    
    func testWriteWithDictionary() throws {
        
        XCTAssertNoThrow(dictionary.write(dictionary: ["hello": ["en": "hello"]]), "Successfull write.")

    }
    
    static var allTests = [
        ("testGetDictionary", testGetDictionary),
        ("testWriteWithDictionary", testWriteWithDictionary)
    ]

}
