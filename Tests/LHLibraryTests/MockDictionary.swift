//
//  MockDictionary.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import LHLibrary

class MockDictionary: DictionaryProtocol {
    
    var getDictionaryCallsCount = 0
    var getDictionaryResult: [String: [String: String]]! = [:]

    func getDictionary() -> [String: [String: String]] {
        getDictionaryCallsCount += 1
        return getDictionaryResult
    }

    var writeCallsCount = 0
    var writeParameters: (dictionary: [String: [String: String]], Void)?
    var writeParametersList = [(dictionary: [String: [String: String]], Void)]()

    func write(dictionary: [String: [String: String]]) {
        writeCallsCount += 1
        writeParameters = (dictionary, ())
        writeParametersList.append((dictionary, ()))
    }
}
