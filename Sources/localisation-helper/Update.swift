//
//  Update.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Update: UpdateProtocol {
    
    func update(newWord: String, key: String, language: String) {

        let dict = Dictionary()
        var dictionary = dict.getDictionaryFromJson()
        
        var isInDictionary = false
        var thisDictionary: [String: String] = [:]
        
        for (englishWord, wordsArray) in dictionary {
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                // Если слово есть в словаре
                if language.lowercased() == dictionaryLanguage.lowercased()
                    && key.lowercased() == dictionaryTranslation.lowercased() {
                    dictionary[englishWord]?[dictionaryLanguage] = newWord
                    dictionary.updateValue(wordsArray, forKey: dictionaryLanguage)
                    isInDictionary = true
                }
            }
        }
        if isInDictionary != true { // Если слова нет в словаре
            thisDictionary[language] = key
            dictionary[newWord]?[language] = key
            dictionary.updateValue(thisDictionary, forKey: newWord)
        }
        dict.WritingToJsonFile(dictionary: dictionary)
//        print(dictionary)
    }
    
}


