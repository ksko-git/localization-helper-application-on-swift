//
//  TerminalOutput.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class TerminalOutput: TerminalOutputProtocol {
    
    let dict: DictionaryProtocol
    
    init(dictionary: DictionaryProtocol) {
        self.dict = dictionary
    }
    
    func consoleOutput(word: String) {
        return print(word)
    }
    
    func outputTemplates(variant: TemplateOptions, firstArgument: String, secondArgument: String) {
        
        variant == TemplateOptions.colon
            ? print("    \(firstArgument): \(secondArgument)")
            : print("\(firstArgument) = \(secondArgument)")        
    }
    
    func outputNotFound(isInDictionary: Bool) {
        if isInDictionary == false {
            print("Not found")
        }
    }
    
}
