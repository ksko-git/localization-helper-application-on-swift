//
//  ValidationResult.swift
//  
//
//  Created by Ксюся on 18.11.2020.
//

import Foundation

public enum ValidationResult: LocalizedError {

    case somethingWentWrong
    case dictionaryIsEmpty
    case onlyOneParameterEnteredToDelete
    case parseWentWrong
    case pathToFileIsEmpty
    case failedToWrite
    case helpMessageIsNotShown
    
    public var errorDescription: String {
        switch self {
        case .somethingWentWrong:
            return "Something went wrong!"
        case .dictionaryIsEmpty:
            return "Dictionary is empty!"
        case .onlyOneParameterEnteredToDelete:
            return "Only one parameter entered to delete!"
        case .pathToFileIsEmpty:
            return "Path to file is empty!"
        case .failedToWrite:
            return "Failed to write!"
        case .helpMessageIsNotShown:
            return "Help message is not shown!!"
        default:
            return "Something went wrong!"
        }
    }
    
}
