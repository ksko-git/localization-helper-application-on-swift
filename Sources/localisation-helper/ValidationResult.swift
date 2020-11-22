//
//  ValidationResult.swift
//  
//
//  Created by Ксюся on 18.11.2020.
//

import Foundation

public enum ValidationResult: LocalizedError {
    
    case success
    case somethingWentWrong
    case dictionaryIsEmpty
    case onlyOneParameterEnteredToDelete
    case parseWentWrong
    
    public var errorDescription: String? {
        switch self {
        case .somethingWentWrong:
            return "Something went wrong!"
        case .dictionaryIsEmpty:
            return "Dictionary is empty!"
        case .onlyOneParameterEnteredToDelete:
            return "Only one parameter entered to delete!"
        default:
            return "Something went wrong!"
        }
    }
    
}
