//
//  TestArgumentParser.swift
//
//
//  Created by Ксюся on 17.11.2020.
//

@testable import localisation_helper
import XCTest

final class TestArgumentParser: XCTestCase {
    
    var argumentsParser: ArgumentsParser!

    override func setUp() {
        super.setUp()
        argumentsParser = ArgumentsParser()
    }
    override func tearDown() {
        argumentsParser = nil
        super.tearDown()
    }

    func testSearchOptionWithTwoKeys() throws {
        
        let arguments = argumentsParser.parse(["search", "-k", "day", "-l", "pt"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, "day")
                XCTAssertEqual(language, "pt")
            default:
                XCTFail(ValidationResult.parseWentWrong.errorDescription!)
            }

    }
    
    func testSearchOptionWithKKey() throws {
        
        let arguments = argumentsParser.parse(["search", "-k", "day"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, "day")
                XCTAssertEqual(language, nil)
            default:
                XCTFail(ValidationResult.parseWentWrong.errorDescription!)
            }

    }
    
    func testSearchOptionWithLKey() throws {
        
        let arguments = argumentsParser.parse(["search", "-l", "pt"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, "pt")
            default:
                XCTFail(ValidationResult.parseWentWrong.errorDescription!)
            }

    }
    
    func testSearchOptionWithTwoNils() throws {
        
        let arguments = argumentsParser.parse(["search"])

        switch arguments {
            case .search(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, nil)
            default:
                XCTFail(ValidationResult.parseWentWrong.errorDescription!)
            }

    }
    
    func testUdpateOptionWithTwoKeys() throws {
        
        let arguments = argumentsParser.parse(["update", "hi", "-k", "hello", "-l", "en"])

        switch arguments {
            case .update(let word, let key, let language):
                XCTAssertEqual(word, "hi")
                XCTAssertEqual(key, "hello")
                XCTAssertEqual(language, "en")
            default:
                XCTFail(ValidationResult.parseWentWrong.errorDescription!)
            }

    }
    
    func testDeleteOptionWithTwoKeys() throws {
        
        let arguments = argumentsParser.parse(["delete", "-k", "hello", "-l", "en"])

        switch arguments {
            case .delete(let key, let language):
                XCTAssertEqual(key, "hello")
                XCTAssertEqual(language, "en")
            default:
                XCTFail(ValidationResult.parseWentWrong.errorDescription!)
            }

    }
    
    func testParseFailWithNoArguments() throws {
        
        let arguments = argumentsParser.parse([])

        switch arguments {
            case .help(let message):
                XCTAssertEqual(message, Commands.helpMessage())
                XCTAssertTrue(true, ValidationResult.parseWentWrong.errorDescription!)
            default:
                XCTFail("Help message is not shown!")
        }
    }
    
    func testParseFailWithSearchArgument() throws {
        
        let arguments = argumentsParser.parse(["-l", "search"])

        switch arguments {
            case .help(let message):
                XCTAssertEqual(message, Commands.helpMessage())
                XCTAssertTrue(true, ValidationResult.parseWentWrong.errorDescription!)
            default:
                XCTFail("The search function find something, but not the words from dictionary!")
        }
    }
    
    func testParseFailWithUpdateArgument() throws {
        
        let arguments = argumentsParser.parse(["hello", "update"])

        switch arguments {
            case .help(let message):
                XCTAssertEqual(message, Commands.helpMessage())
                XCTAssertTrue(true, ValidationResult.parseWentWrong.errorDescription!)
            default:
                XCTFail("The update function refresh something, but not the word!")
        }
    }
    
    func testParseFailWithDeleteArgument() throws {
        
        let arguments = argumentsParser.parse(["-k", "-l", "delete"])

        switch arguments {
            case .help(let message):
                XCTAssertEqual(message, Commands.helpMessage())
                XCTAssertTrue(true, ValidationResult.parseWentWrong.errorDescription!)
            default:
                XCTFail("The delete function removed something, but not the word!")
        }
    }
    
    func testParseFailWithDeleteArgumentWithoutKeys() throws {

        let arguments = argumentsParser.parse(["delete"])

        switch arguments {
            case .delete(let key, let language):
                XCTAssertEqual(key, nil)
                XCTAssertEqual(language, nil)
                XCTAssertTrue(true, ValidationResult.parseWentWrong.errorDescription!)
            default:
                XCTFail("The delete function removed a word with one key!")
        }
    }
    
    func testHelpOption() throws {

        let arguments = argumentsParser.parse(["-h"])

        switch arguments {
            case .help(let message):
                XCTAssertEqual(message, Commands.helpMessage())
            default:
                XCTFail(ValidationResult.parseWentWrong.errorDescription!)
        }
    }
    
    static var allTests = [
        ("testSearchOptionWithTwoKeys", testSearchOptionWithTwoKeys),
        ("testSearchOptionWithKKey", testSearchOptionWithKKey),
        ("testSearchOptionWithLKey", testSearchOptionWithLKey),
        ("testSearchOptionWithTwoNils", testSearchOptionWithTwoNils),
        ("testUdpateOptionWithTwoKeys", testUdpateOptionWithTwoKeys),
        ("testDeleteOptionWithTwoKeys", testDeleteOptionWithTwoKeys),
        ("testParseFailWithNoArguments", testParseFailWithNoArguments),
        ("testParseFailWithSearchArgument", testParseFailWithSearchArgument),
        ("testParseFailWithUpdateArgument", testParseFailWithUpdateArgument),
        ("testParseFailWithDeleteArgument", testParseFailWithDeleteArgument),
        ("testParseFailWithDeleteArgumentWithoutKeys", testParseFailWithDeleteArgumentWithoutKeys),
        ("testHelpOption", testHelpOption)
    ]
    
}
