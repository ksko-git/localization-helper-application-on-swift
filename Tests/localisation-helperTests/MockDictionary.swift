//
//  MockDictionary.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import localisation_helper

class MockDictionary: DictionaryProtocol {
    
    var writeParameters: ([String : [String : String]])!
    var writeResult: ()
    var writeCallsCount = 0
    
    func write(dictionary: [String : [String : String]]) {
        writeCallsCount += 1
        writeParameters = ["hello": ["en": "hello"]]
        return writeResult
    }
    
    var getDictionaryParameters: ()!
    var getDictionaryResult: [String: [String: String]] = [:]
    var getDictionaryCallsCount = 0
    
    func getDictionary() -> [String: [String: String]] {
        getDictionaryCallsCount += 1
        getDictionaryParameters = ()
        return getDictionaryResult
    }
    
}
