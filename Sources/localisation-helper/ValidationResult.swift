//
//  ValidationResult.swift
//  
//
//  Created by Ксюся on 18.11.2020.
//

import Foundation

public enum ValidationResult: Swift.Error, Equatable {

    case somethingWentWrong
    case dictionaryIsEmpty
    case wordOutOfDictionary
    case twoParametersForDeleteFunctionExpected
    case parseWentWrong
    case pathToFileIsEmpty
    case failedToWrite
    case failedToRead
    case helpMessageIsNotShown
    
    public var errorDescription: String {
        switch self {
        case .somethingWentWrong:
            return "Something went wrong!"
        case .dictionaryIsEmpty:
            return "Dictionary is empty!"
        case .wordOutOfDictionary:
            return "No such word in the dictionary!"
        case .twoParametersForDeleteFunctionExpected:
            return "The delete function must receive two parameters!"
        case .pathToFileIsEmpty:
            return "Path to file is empty!"
        case .failedToWrite:
            return "Failed to write!"
        case .failedToRead:
            return "Failed to read the dictionary!"
        case .helpMessageIsNotShown:
            return "Help message is not shown!"
        default:
            return "Something went wrong!"
        }
    }
    
    public var errorCode: Int {
        switch self {
        case .somethingWentWrong:
            return 10
        case .dictionaryIsEmpty:
            return 11
        case .wordOutOfDictionary:
            return 12
        case .twoParametersForDeleteFunctionExpected:
            return 13
        case .pathToFileIsEmpty:
            return 14
        case .failedToWrite:
            return 15
        case .failedToRead:
            return 16
        case .helpMessageIsNotShown:
            return 17
        default:
            return 10
        }
    }
    
}
