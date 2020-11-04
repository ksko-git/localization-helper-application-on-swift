//
//  Delete.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

func removeFromDictionaryKL(key: String, language: String) -> [String: [String: String]] {
    let dict = Dictionary()
    var dictionary = dict.jsonInDictionary()
    
    for (englishWord, wordsArray) in dictionary {
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            // -k -l
            if language.lowercased() == dictionaryLanguage.lowercased()
                && key.lowercased() == dictionaryTranslation.lowercased() {
                dictionary.removeValue(forKey: englishWord)
            // -k || -l
            } else if key.lowercased() == dictionaryTranslation.lowercased()
                        || language.lowercased() == dictionaryLanguage.lowercased() {
                dictionary[englishWord]?[dictionaryLanguage] = nil
            }
        }
    }
//    print(dictionary)
    return dictionary
}
