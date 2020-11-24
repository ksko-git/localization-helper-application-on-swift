//
//  TerminalOutput.swift
//  
//
//  Created by Ксюся on 30.10.2020.
//

import Foundation

public class TerminalOutput: TerminalOutputProtocol {
    
    public func consoleOutput(word: String) {
        print(word)
    }
    
    public func outputTemplates(variant: TemplateOptions, firstArgument: String, secondArgument: String) {        
        variant == .colon
            ? print("    \(firstArgument): \(secondArgument)")
            : print("\(firstArgument) = \(secondArgument)")        
    }
    
    public func outputNotFound(isInDictionary: Bool) {
        if isInDictionary == false {
            print("Not found")
        }
    }
    
}
