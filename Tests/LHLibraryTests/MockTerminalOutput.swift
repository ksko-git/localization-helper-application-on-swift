//
//  MockTerminalOutput.swift
//  
//
//  Created by Ксюся on 19.11.2020.
//

@testable import LHLibrary

class MockTerminalOutput: TerminalOutputProtocol {

    var consoleOutputCallsCount = 0
    var consoleOutputParameters: (word: String, Void)?
    var consoleOutputParametersList = [(word: String, Void)]()

    func consoleOutput(word: String) {
        consoleOutputCallsCount += 1
        consoleOutputParameters = (word, ())
        consoleOutputParametersList.append((word, ()))
    }

    var outputTemplatesCallsCount = 0
    var outputTemplatesParameters: (variant: TemplateOptions, firstArgument: String, secondArgument: String)?
    var outputTemplatesParametersList = [(variant: TemplateOptions, firstArgument: String, secondArgument: String)]()

    func outputTemplates(variant: TemplateOptions, firstArgument: String, secondArgument: String) {
        outputTemplatesCallsCount += 1
        outputTemplatesParameters = (variant, firstArgument, secondArgument)
        outputTemplatesParametersList.append((variant, firstArgument, secondArgument))
    }

    var outputNotFoundCallsCount = 0
    var outputNotFoundParameters: (isInDictionary: Bool, Void)?
    var outputNotFoundParametersList = [(isInDictionary: Bool, Void)]()

    func outputNotFound(isInDictionary: Bool) {
        outputNotFoundCallsCount += 1
        outputNotFoundParameters = (isInDictionary, ())
        outputNotFoundParametersList.append((isInDictionary, ()))
    }
    
}
