//
//  TestDictionary.swift
//  
//
//  Created by Ксюся on 23.11.2020.
//

@testable import localisation_helper
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
        
        XCTAssertNoThrow(try dictionary.getDictionary(), "Dictionary successfully received.")

    }
    
    func testWriteWithDictionary() throws {
        
        XCTAssertNoThrow(try dictionary.write(dictionary: ["hello": ["en": "hello"]]), "Successfull write.")

    }
    
    func testWriteWithEmptyDictionary() throws {
        
        XCTAssertThrowsError(try dictionary.write(dictionary: [:]), "A failedToRead Error should have been thrown but no Error was thrown.") { error in
            XCTAssertEqual(error as? ValidationResult, ValidationResult.failedToWrite)
         }
        
    }
    
    static var allTests = [
        ("testGetDictionary", testGetDictionary),
        ("testWriteWithDictionary", testWriteWithDictionary),
        ("testWriteWithEmptyDictionary", testWriteWithEmptyDictionary),
    ]

}
