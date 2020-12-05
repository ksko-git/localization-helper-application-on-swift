//
//  Search.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

public class Search: SearchProtocol {
    
    let output: TerminalOutputProtocol
    let dict: DictionaryProtocol
    var isInDictionary: Bool
    var newDictionary: [String: [String: String]] = [:]
    var languageAndTranslation: [String: String] = [:]
    
    init(dictionary: DictionaryProtocol, terminalOutput: TerminalOutputProtocol) {
        self.dict = dictionary
        self.output = terminalOutput
        self.isInDictionary = false
        self.newDictionary = [:]
        self.languageAndTranslation = [:]
    }
    
    public func search(key: String?, language: String?) -> Result<[String: [String: String]], ValidationResult> {
        
        let dictionary = dict.getDictionary()
        
        if key == nil && language == nil {
            newDictionary = defaultSearch(dictionary: dictionary)
            isInDictionary = true
        }
        
        if let key: String = key, language == nil {
            output.consoleOutput(word: key.lowercased())
        }
        for (englishWord, wordsArray) in dictionary {
            // -l
            if key == nil, let language: String = language, let word = wordsArray[language.lowercased()] {
                
                languageAndTranslation[englishWord] = word
                newDictionary[englishWord] = languageAndTranslation
                languageAndTranslation = [:]
                
                output.outputTemplates(variant: .equalSign, firstArgument: englishWord, secondArgument: word)
                isInDictionary = true
            }
            for (_, dictionaryTranslation) in wordsArray {
                if let key: String = key, dictionaryTranslation.lowercased() == key.lowercased() {
                    for (thisLanguage, thisTranslation) in wordsArray {
                        // -k
                        if language == nil {
                            languageAndTranslation[thisLanguage] = thisTranslation
                            newDictionary[englishWord] = languageAndTranslation
                            
                            output.outputTemplates(variant: .colon, firstArgument: thisLanguage, secondArgument: thisTranslation)
                            isInDictionary = true
                        // -k -l
                        } else if let language: String = language, thisLanguage == language.lowercased() {
                            languageAndTranslation[thisLanguage] = thisTranslation
                            newDictionary[englishWord] = languageAndTranslation
                            
                            output.consoleOutput(word: thisTranslation)
                            isInDictionary = true
                        }
                    }
                }
            }
        }
        output.outputNotFound(isInDictionary: isInDictionary)            
//        return newDictionary
        return .success(newDictionary)
    }

    public func defaultSearch(dictionary: [String: [String: String]]) -> [String: [String: String]] {
        
        for (englishWord, wordsArray) in dictionary {
            output.consoleOutput(word: englishWord)
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                
                languageAndTranslation[dictionaryLanguage] = dictionaryTranslation
                newDictionary[englishWord] = languageAndTranslation
                
                output.outputTemplates(variant: .colon, firstArgument: dictionaryLanguage, secondArgument: dictionaryTranslation)
            }
        }
        return newDictionary
    }
    
}


