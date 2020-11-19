//
//  MockTerminalOutput.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import localisation_helper

class MockTerminalOutput: TerminalOutputProtocol {   
    
    var consoleOutputParameters: (String)!
    var consoleOutputResult: ()
    var consoleOutputCallsCount = 0
    
    func consoleOutput(word: String) {
        consoleOutputCallsCount += 1
        consoleOutputParameters = word
        return consoleOutputResult
    }
    
    var outputTemplatesParameters: (TemplateOptions, String, String)!
    var outputTemplatesResult: ()
    var outputTemplatesCallsCount = 0
    
    func outputTemplates(variant: TemplateOptions, firstArgument: String, secondArgument: String) {
        outputTemplatesCallsCount += 1
        outputTemplatesParameters = (variant, firstArgument, secondArgument)
        return outputTemplatesResult
    }
    
    var outputNotFoundParameters: (Bool)!
    var outputNotFoundResult: ()
    var outputNotFoundCallsCount = 0

    func outputNotFound(isInDictionary: Bool) {
        outputNotFoundCallsCount += 1
        outputNotFoundParameters = true
        return outputNotFoundResult
    }

}
