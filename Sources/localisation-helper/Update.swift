//
//  Update.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Update {
    
    func update(newWord: String, key: String, language: String) -> [String: [String: String]] {

        let dict = Dictionary()
        var dictionary = dict.jsonInDictionary()
        
        var thisDictionary: [String: String] = [:]
        for (englishWord, wordsArray) in dictionary {
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                // Если слово есть в словаре
                if language.lowercased() == dictionaryLanguage.lowercased()
                    && key.lowercased() == dictionaryTranslation.lowercased() {
                    dictionary[englishWord]?[dictionaryLanguage] = newWord
                    dictionary.updateValue(wordsArray, forKey: dictionaryLanguage)
                    dict.isInDictionary = true
                }
            }
        }
        if dict.isInDictionary != true { // Если слова нет в словаре
            thisDictionary[language] = key
            dictionary[newWord]?[language] = key
            dictionary.updateValue(thisDictionary, forKey: newWord)
        }
//        print(dictionary)
        return dictionary
    }
    
}


