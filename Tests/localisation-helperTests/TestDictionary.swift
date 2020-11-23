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
        path = ""
        switch path {
        case "":
            XCTAssertEqual(path, "")
        default:
            XCTFail("Dictionary must be empty!")
        }
    }
    
//    func testDictionaryIsEmpty() throws {
//        path = "wrong path"
//        do {
//            try dictionary.write(dictionary: [:])
//        } catch let error as ValidationResult {
//            XCTFail(error.errorDescription)
//        }
//    }
    
    static var allTests = [
        ("testWrongPathToFile", testWrongPathToFile),
//        ("testDictionaryIsEmpty", testDictionaryIsEmpty),
    ]

}
