//
//  Search.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Search: SearchProtocol {
    
    let dict = Dictionary()
    let output = TerminalOutput()
    
    func search(key: String, language: String) {
        let dictionary = dict.getDictionaryFromJson()
        var isInDictionary = false
        
        if language.isEmpty {
            output.consoleOutput(word: key.lowercased())
        }
        for (englishWord, wordsArray) in dictionary {
            // -l
            if key.isEmpty, let word = wordsArray[language.lowercased()] {
                output.outputTemplates(variant: false, firstArgument: englishWord, secondArgument: word)
                isInDictionary = true
            }
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                if dictionaryTranslation.lowercased() == key.lowercased() {
                    for (thisLanguage, thisTranslation) in wordsArray {
                        // -k
                        if language.isEmpty {
                            output.outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: thisTranslation)
                            isInDictionary = true
                        // -k -l
                        } else if thisLanguage == language.lowercased() {
                            output.consoleOutput(word: thisTranslation)
                            isInDictionary = true
                        }
                    }
                }
            }
        }
        output.outputNotFound(isInDictionary: isInDictionary)
    }

    func defaultSearch() {
        let dictionary = dict.getDictionaryFromJson()
        for (englishWord, wordsArray) in dictionary {
            output.consoleOutput(word: englishWord)
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                output.outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: dictionaryTranslation)
            }
        }
    }
    
}


