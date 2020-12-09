//
//  Search.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Search: SearchProtocol {
    
    let dict: DictionaryProtocol
    var isInDictionary: Bool
    var newDictionary: [String: [String: String]] = [:]
    var languageAndTranslation: [String: String] = [:]
    
    init(dictionary: DictionaryProtocol) {
        self.dict = dictionary
        self.isInDictionary = false
        self.newDictionary = [:]
        self.languageAndTranslation = [:]
    }
    
    public func search(key: String?, language: String?) -> Result<[String: [String: String]], ValidationResult> {
        
        let dictionary = dict.getDictionary()
        
        if key == nil && language == nil {
            newDictionary = defaultSearch(dictionary: dictionary)
            isInDictionary = true
        }
        for (englishWord, wordsArray) in dictionary {
            // -l
            if key == nil, let language: String = language, let word = wordsArray[language.lowercased()] {
                
                languageAndTranslation[englishWord] = word
                newDictionary[englishWord] = languageAndTranslation
                languageAndTranslation = [:]
                isInDictionary = true
            }
            for (_, dictionaryTranslation) in wordsArray {
                if let key: String = key, dictionaryTranslation.lowercased() == key.lowercased() {
                    for (thisLanguage, thisTranslation) in wordsArray {
                        // -k
                        if language == nil {
                            languageAndTranslation[thisLanguage] = thisTranslation
                            newDictionary[englishWord] = languageAndTranslation
                            isInDictionary = true
                        // -k -l
                        } else if let language: String = language, thisLanguage == language.lowercased() {
                            languageAndTranslation[thisLanguage] = thisTranslation
                            newDictionary[englishWord] = languageAndTranslation
                            isInDictionary = true
                        }
                    }
                }
            }
        }
        return .success(newDictionary)
    }

    public func defaultSearch(dictionary: [String: [String: String]]) -> [String: [String: String]] {
        
        for (englishWord, wordsArray) in dictionary {
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                languageAndTranslation[dictionaryLanguage] = dictionaryTranslation
                newDictionary[englishWord] = languageAndTranslation
            }
        }
        return newDictionary
    }
    
}


