//
//  Update.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Update: UpdateProtocol {
    
    var dict: Dictionary
    
    init() {
        self.dict = Dictionary()
    }
    
    func update(newWord: String?, key: String?, language: String?) {

        var dictionary = dict.getDictionary()
        
        var isInDictionary = false
        var thisDictionary: [String: String] = [:]
        
        for (englishWord, wordsArray) in dictionary {
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                // Если слово есть в словаре
                if let language: String = language, let key: String = key, language.lowercased() == dictionaryLanguage.lowercased()
                    && key.lowercased() == dictionaryTranslation.lowercased() {
                    dictionary[englishWord]?[dictionaryLanguage] = newWord
                    dictionary.updateValue(wordsArray, forKey: dictionaryLanguage)
                    isInDictionary = true
                }
            }
        }
        if let newWord: String = newWord, let language: String = language,
           let key: String = key, isInDictionary != true { // Если слова нет в словаре
            thisDictionary[language] = key
            dictionary[newWord]?[language] = key
            dictionary.updateValue(thisDictionary, forKey: newWord)
        }
        dict.writeToFile(dictionary: dictionary)
    }
    
}


