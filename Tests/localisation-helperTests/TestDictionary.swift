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
    var path: String!
    var error: ValidationResult!

    override func setUp() {
        super.setUp()
        dictionary = Dictionary()
        path = Dictionary().path
    }

    override func tearDown() {
        dictionary = nil
        super.tearDown()
    }

    func testWrongPathToFile() {
        path = "wrong path"
        switch path {
        case "wrong path":
            XCTAssertEqual(path, "wrong path")
        default:
            XCTFail("Dictionary must be empty!")
        }
    }
    
    func testDictionaryIsEmpty() throws {
        do {
            let dict = try dictionary.getDictionary()
            XCTAssertEqual(dict, [:])
        } catch let error as ValidationResult {
            XCTFail(error.errorDescription)
        }
    }
    
    func testWriteFunction() throws {
        do {
            let _ = try dictionary.write(dictionary: ["hello": ["en": "hello"]])
        } catch let error as ValidationResult {
            XCTFail(error.errorDescription)
        }
    }
    
    static var allTests = [
        ("testWrongPathToFile", testWrongPathToFile),
        ("testDictionaryIsEmpty", testDictionaryIsEmpty),
        ("testWriteFunction", testWriteFunction),
    ]

}
