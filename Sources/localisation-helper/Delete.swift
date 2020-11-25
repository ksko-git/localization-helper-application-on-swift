//
//  Delete.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

public class Delete: DeleteProtocol {
    
    var output: TerminalOutputProtocol
    let dict: DictionaryProtocol
    
    init(dictionary: DictionaryProtocol, terminalOutput: TerminalOutputProtocol) {
        self.dict = dictionary
        self.output = terminalOutput
    }
    
    public func delete(key: String?, language: String?) throws {
        
        var isWordExist = false
        
        guard key != nil && language != nil else {
            throw ValidationResult.twoParametersForDeleteFunctionExpected
        }
        
        do {
            var dictionary = try dict.getDictionary()
            for (englishWord, wordsArray) in dictionary {
                var wordsArray = wordsArray
                // -k -l
                if let language: String = language, let key: String = key, wordsArray[language]?.lowercased() == key.lowercased() {
                    wordsArray[language] = nil
                    dictionary[englishWord] = wordsArray
                    isWordExist = true
                }
            }
            
            guard isWordExist == true else {
                throw ValidationResult.wordOutOfDictionary
            }
            
            try dict.write(dictionary: dictionary)
            output.consoleOutput(word: "Слово удалено.")
            output.consoleOutput(word: "Обновленный словарь: \(dictionary)")
            
        } catch let error as ValidationResult {
            throw error
        }
        
    }
}


