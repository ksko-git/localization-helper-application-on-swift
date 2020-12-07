//
//  Update.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Update: UpdateProtocol {
    
    let dict: DictionaryProtocol
    var languageAndTranslation: [String: String] = [:]
    
    init(dictionary: DictionaryProtocol) {
        self.dict = dictionary
        self.languageAndTranslation = [:]
    }
    
    public func update(newWord: String?, key: String?, language: String?) -> Result<[String: [String: String]], ValidationResult> {
        
        var dictionary = dict.getDictionary()
        var isInDictionary = false
        
        if let newWord: String = newWord, let language: String = language, let key: String = key {
            
            for (englishWord, wordsArray) in dictionary {
                for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                    // Если слово есть в словаре
                    if language.lowercased() == dictionaryLanguage.lowercased()
                        && key.lowercased() == dictionaryTranslation.lowercased() {
                        dictionary[englishWord]?[dictionaryLanguage] = newWord
                        isInDictionary = true
                    }
                }
            }
            if isInDictionary == false { // Если слова нет в словаре
                languageAndTranslation[language] = key
                dictionary[newWord]?[language] = key
                dictionary.updateValue(languageAndTranslation, forKey: newWord)
            }
            dict.write(dictionary: dictionary)
            return .success(dictionary)
        } else {
            return .failure(.threeParametersForUpdateFunctionExpected)
        }
        
    }
}
