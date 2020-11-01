//
//  Search.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

// Поиск по ключам --key --language
func searchOptionsKL(key: String, language: String) throws {
    if language == "none" {
        consoleOutput(word: key.lowercased())
    }
    for (englishWord, wordsArray) in dictionary {
        // -l
        if key == "none", let word = wordsArray[language.lowercased()] {
            outputTemplates(variant: false, firstArgument: englishWord, secondArgument: word)
        }
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            if dictionaryTranslation.lowercased() == key.lowercased() {
                for (thisLanguage, thisTranslation) in wordsArray {
                    // -k
                    if language == "none" {
                        outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: thisTranslation)
                    // -k -l
                    } else if thisLanguage == language.lowercased() {
                        consoleOutput(word: thisTranslation)
                        isInDictionary = true
                    }
                }
            }
        }
    }
    outputNotFound(isInDictionary: isInDictionary)
}

func defaultSearch() {
    for (englishWord, wordsArray) in dictionary {
        consoleOutput(word: englishWord)
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: dictionaryTranslation)
        }
    }
    outputNotFound(isInDictionary: isInDictionary)
}
