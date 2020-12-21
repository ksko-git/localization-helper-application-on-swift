//
//  Delete.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Delete: DeleteProtocol {
    
    let dict: DictionaryProtocol
    
    init(dictionary: DictionaryProtocol) {
        self.dict = dictionary
    }
    
    public func delete(key: String?, language: String?) -> Result<[String : [String : String]], ValidationResult> {
        
        var isInDictionary = false
        var dictionary = dict.getDictionary()
        
        guard key != nil && language != nil else {
            return .failure(.twoParametersForDeleteFunctionExpected)
        }
        for (englishWord, wordsArray) in dictionary {
            var wordsArray = wordsArray
            // -k -l
            if let language: String = language, let key: String = key, wordsArray[language]?.lowercased() == key.lowercased() {
                wordsArray[language] = nil
                dictionary[englishWord] = wordsArray
                isInDictionary = true
            }
        }
        guard isInDictionary == true else {
            return .failure(.wordOutOfDictionary)
        }
        return .success(dictionary)
        
    }
}
