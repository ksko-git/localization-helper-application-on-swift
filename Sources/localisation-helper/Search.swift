//
//  Search.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class Search: SearchProtocol {
    
    var output: TerminalOutput
    let dict: DictionaryProtocol
    
    init(dictionary: DictionaryProtocol, terminalOutput: TerminalOutput) {
        self.dict = dictionary
        self.output = terminalOutput
    }
    
    func search(key: String?, language: String?) {
        let dictionary = dict.getDictionary()
        var isInDictionary = false
        
        if let key: String = key, language == nil {
            output.consoleOutput(word: key.lowercased())
        }
        for (englishWord, wordsArray) in dictionary {
            // -l
            if key == nil, let language: String = language, let word = wordsArray[language.lowercased()] {
                output.outputTemplates(variant: false, firstArgument: englishWord, secondArgument: word)
                isInDictionary = true
            }
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                if let key: String = key, dictionaryTranslation.lowercased() == key.lowercased() {
                    for (thisLanguage, thisTranslation) in wordsArray {
                        // -k
                        if language == nil {
                            output.outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: thisTranslation)
                            isInDictionary = true
                        // -k -l
                        } else if let language: String = language, thisLanguage == language.lowercased() {
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
        let dictionary = dict.getDictionary()
        for (englishWord, wordsArray) in dictionary {
            output.consoleOutput(word: englishWord)
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                output.outputTemplates(variant: true, firstArgument: dictionaryLanguage, secondArgument: dictionaryTranslation)
            }
        }
    }
    
}


