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
    
    public func delete(key: String?, language: String?) -> ValidationResult {
        var dictionary = dict.getDictionary()
        
        guard key != nil && language != nil else {
            output.consoleOutput(word: "Удаление только по одному из параметров осуществить невозможно.\nВведите слово и язык.")
            return .SomethingGoWrong
        }
        
        for (englishWord, wordsArray) in dictionary {
            var wordsArray = wordsArray
            // -k -l
            if let language: String = language, let key: String = key, wordsArray[language]?.lowercased() == key.lowercased() {
                wordsArray[language] = nil
                dictionary[englishWord] = wordsArray
            }
        }
        dict.write(dictionary: dictionary)
        output.consoleOutput(word: "Слово удалено.")
        return .SuccessfullDelete
    }
}


