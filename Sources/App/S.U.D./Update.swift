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
    var languageAndTranslation: [String: String] = [:]
    
    init(dictionary: DictionaryProtocol, terminalOutput: TerminalOutputProtocol) {
        self.dict = dictionary
        self.output = terminalOutput
        self.languageAndTranslation = [:]
    }
    
    public func update(newWord: String, key: String, language: String) -> Result<[String : [String : String]], ValidationResult> {
        
        var dictionary = dict.getDictionary()
        var isInDictionary = false
        
        for (englishWord, wordsArray) in dictionary {
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                // Если слово есть в словаре
                if language.lowercased() == dictionaryLanguage.lowercased()
                    && key.lowercased() == dictionaryTranslation.lowercased() {
                    dictionary[englishWord]?[dictionaryLanguage] = newWord
                    isInDictionary = true
                }
            }
        }        
        if isInDictionary == false { // Если слова нет в словаре
            languageAndTranslation[language] = key
            dictionary[newWord]?[language] = key
            dictionary.updateValue(languageAndTranslation, forKey: newWord)
        }
        dict.write(dictionary: dictionary)
        output.consoleOutput(word: "Словарь обновлен.")
        output.consoleOutput(word: "Обновленный словарь: \(dictionary)")
        return .success(dictionary)
    }
}
