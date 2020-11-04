//
//  Update.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

func updateDictionaryKL(newWord: String, key: String, language: String) -> [String: [String: String]] {
    let dict = Dictionary()
    var dictionary = dict.jsonInDictionary()
    
    var isInDictionary = false
    var thisDictionary: [String: String] = [:]
    // -k -l || -k || -l
    for (englishWord, wordsArray) in dictionary {
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            // Если слово есть в словаре
            if language.lowercased() == dictionaryLanguage.lowercased()
                && key.lowercased() == dictionaryTranslation.lowercased() {
                // Обновим его
                dictionary[englishWord]?[dictionaryLanguage] = newWord
                dictionary.updateValue(wordsArray, forKey: dictionaryLanguage)
                isInDictionary = true
            }
        }
    }
    // Если слова нет в словаре
    if isInDictionary != true {
        thisDictionary[language] = key
        dictionary[newWord]?[language] = key
        dictionary.updateValue(thisDictionary, forKey: newWord)
    }
//    print(dictionary)
    return dictionary
}
