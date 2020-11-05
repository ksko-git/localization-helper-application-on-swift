//
//  Search.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Search {
    
    func search(key: String, language: String) {
        let dict = Dictionary()
        let dictionary = dict.jsonInDictionary()
        let output = TerminalOutput()
        
        if language.isEmpty {
            output.consoleOutput(word: key.lowercased())
        }
        for (englishWord, wordsArray) in dictionary {
            // -l
            if key.isEmpty, let word = wordsArray[language.lowercased()] {
                output.outputTemplates(variant: false, firstArgument: englishWord, secondArgument: word)
            }
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                if dictionaryTranslation.lowercased() == key.lowercased() {
                    for (thisLanguage, thisTranslation) in wordsArray {
                        // -k
                        if language.isEmpty {
                            output.outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: thisTranslation)
                        // -k -l
                        } else if thisLanguage == language.lowercased() {
                            output.consoleOutput(word: thisTranslation)
                            dict.isInDictionary = true
                        }
                    }
                }
            }
        }
        output.outputNotFound(isInDictionary: dict.isInDictionary)
    }

    func defaultSearch() {
        let dict = Dictionary()
        let dictionary = dict.jsonInDictionary()
        let output = TerminalOutput()
        
        for (englishWord, wordsArray) in dictionary {
            output.consoleOutput(word: englishWord)
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                output.outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: dictionaryTranslation)
            }
        }
        output.outputNotFound(isInDictionary: dict.isInDictionary)
    }
    
}


