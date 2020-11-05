//
//  TerminalOutput.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

class TerminalOutput {
    
    var dict = Dictionary()
    
    func consoleOutput(word: String) { // Вывод в консоль
        return print(word)
    }
    
    func outputTemplates(variant: Bool, firstArgument: String, secondArgument: String) { // Шаблоны
        dict.isInDictionary = true
        variant == true
            ? print("    \(firstArgument): \(secondArgument)")
            : print("\(firstArgument) = \(secondArgument)")        
    }
    
    func outputNotFound(isInDictionary: Bool) { // Вывод Not Found        
        guard dict.isInDictionary == true else {
            return print("Not found")
        }
    }
    
}
