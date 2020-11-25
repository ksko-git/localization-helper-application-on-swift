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
        
        do {
            var dictionary = try dict.getDictionary()
            var isInDictionary = false
            
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
            
            guard isInDictionary == true else {
                throw ValidationResult.wordOutOfDictionary
            }
            
            try dict.write(dictionary: dictionary)
            output.consoleOutput(word: "Словарь обновлен.")
            output.consoleOutput(word: "Обновленный словарь: \(dictionary)")
            
        } catch let error as ValidationResult {
            throw error
        }

    }
}
