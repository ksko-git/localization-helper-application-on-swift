//
//  Search.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

// Поиск по ключам --key --language
func searchOptionsKL (key: String, language: String) throws {
    if language == "none" {
        ConsoleOutput(word: key.lowercased())
    }
    for (englishWord, wordsArray) in dictionary {
        // -l
        if key == "none", let word = wordsArray[language.lowercased()] {
            OutputTemplates(variant: false, firstArgument: englishWord, secondArgument: word)
        }
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            if dictionaryTranslation.lowercased() == key.lowercased() {
                for (thisLanguage, thisTranslation) in wordsArray {
                    // -k
                    if language == "none" {
                        OutputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: thisTranslation)
                    // -k -l
                    } else if thisLanguage == language.lowercased() {
                        ConsoleOutput(word: thisTranslation)
                        flag = true
                    }
                }
            }
        }
    }
    OutputNotFound(flag: flag)
}

func defaultSearch () {
    for (englishWord, wordsArray) in dictionary {
        ConsoleOutput(word: englishWord)
        for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
            OutputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: dictionaryTranslation)
        }
    }
    OutputNotFound(flag: flag)
}
