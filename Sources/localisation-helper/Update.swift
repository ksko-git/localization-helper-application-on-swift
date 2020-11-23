//
//  Update.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

public class Update: UpdateProtocol {
    
    var output: TerminalOutputProtocol
    let dict: DictionaryProtocol
    
    init(dictionary: DictionaryProtocol, terminalOutput: TerminalOutputProtocol) {
        self.dict = dictionary
        self.output = terminalOutput
    }
    
    public func update(newWord: String, key: String, language: String) throws {

        var dictionary = dict.getDictionary()
        
        guard !dictionary.isEmpty else {
            throw ValidationResult.dictionaryIsEmpty
        }
        
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
        try dict.write(dictionary: dictionary)
        output.consoleOutput(word: "Словарь обновлен.")
    }
}
