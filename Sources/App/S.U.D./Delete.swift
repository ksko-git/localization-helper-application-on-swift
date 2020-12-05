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
    
    public func delete(key: String?, language: String?) -> Result<[String : [String : String]], ValidationResult> {
        
        var isInDictionary = false
        var dictionary = dict.getDictionary()
        
        guard key != nil && language != nil else {
            output.consoleOutput(word: ValidationResult.twoParametersForDeleteFunctionExpected.errorDescription)
            return .failure(.twoParametersForDeleteFunctionExpected)
        }
        for (englishWord, wordsArray) in dictionary {
            var wordsArray = wordsArray
            // -k -l
            if let language: String = language, let key: String = key, wordsArray[language]?.lowercased() == key.lowercased() {
                wordsArray[language] = nil
                dictionary[englishWord] = wordsArray
                isInDictionary = true
            }
        }
        guard isInDictionary == true else {
            output.consoleOutput(word: ValidationResult.wordOutOfDictionary.errorDescription)
            return .failure(.wordOutOfDictionary)
        }
        dict.write(dictionary: dictionary)
        output.consoleOutput(word: "Слово удалено.")
        output.consoleOutput(word: "Обновленный словарь: \(dictionary)")
        return .success(dictionary)
        
    }
}
