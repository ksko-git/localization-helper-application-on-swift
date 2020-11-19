//
//  Delete.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

public class Delete: DeleteProtocol {
    
    var output: TerminalOutput
    let dict: DictionaryProtocol
    
    init(dictionary: DictionaryProtocol, terminalOutput: TerminalOutput) {
        self.dict = dictionary
        self.output = terminalOutput
    }
    
    public func delete(key: String?, language: String?) {
        var dictionary = dict.getDictionary()
        
        guard key != nil && language != nil else {
            return output.consoleOutput(word: "Удаление только по одному из параметров осуществить невозможно.\nВведите слово и язык.")
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
    }
}


