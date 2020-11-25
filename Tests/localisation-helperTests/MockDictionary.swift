//
//  MockDictionary.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import localisation_helper

class MockDictionary: DictionaryProtocol {

    var getDictionaryCallsCount = 0
    var getDictionaryError: ValidationResult?
    var getDictionaryResult: [String: [String: String]]! = [:]

    func getDictionary() throws -> [String: [String: String]] {
        getDictionaryCallsCount += 1
        if let error = getDictionaryError {
            throw error
        }
        return getDictionaryResult
    }

    var writeCallsCount = 0
    var writeParameters: (dictionary: [String: [String: String]], Void)?
    var writeParametersList = [(dictionary: [String: [String: String]], Void)]()
    var writeError: ValidationResult?

    func write(dictionary: [String: [String: String]]) throws {
        writeCallsCount += 1
        writeParameters = (dictionary, ())
        writeParametersList.append((dictionary, ()))
        if let error = writeError {
            throw error
        }
    }
    
}
