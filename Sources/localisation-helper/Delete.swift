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
        
        for (englishWord, wordsArray) in dictionary {
            for (dictionaryLanguage, dictionaryTranslation) in wordsArray {
                // -k -l
                if let language: String = language, let key: String = key,
                   language.lowercased() == dictionaryLanguage.lowercased()
                    && key.lowercased() == dictionaryTranslation.lowercased() {
                    dictionary.removeValue(forKey: englishWord)
                // -k || -l
                } else if let language: String = language, let key: String = key,
                          key.lowercased() == dictionaryTranslation.lowercased()
                            || language.lowercased() == dictionaryLanguage.lowercased() {
                    dictionary[englishWord]?[dictionaryLanguage] = nil
                }
            }
        }
        dict.write(dictionary: dictionary)
        output.consoleOutput(word: "Слово удалено.")        
    }
}


