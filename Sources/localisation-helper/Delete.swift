//
//  Delete.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Delete: DeleteProtocol {
    
    var dict: Dictionary
    
    init() {
        self.dict = Dictionary()
    }
    
    func delete(key: String, language: String) {
        var dictionary = dict.getDictionary()
        
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
        dict.writeToFile(dictionary: dictionary)
    }
}


