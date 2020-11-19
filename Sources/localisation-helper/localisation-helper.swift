//
//  localisation-helper.swift
//  
//
//  Created by Ксюся on 17.11.2020.
//

import Foundation
import ArgumentParser

public class Container {
    
    var argumentsParser: ArgumentsParserProtocol {
        ArgumentsParser()
    }
    var search: SearchProtocol {
        Search(dictionary: Dictionary(), terminalOutput: TerminalOutput(dictionary: Dictionary()))
    }
    var update: UpdateProtocol {
        Update(dictionary: Dictionary(), terminalOutput: TerminalOutput(dictionary: Dictionary()))
    }
    var delete: DeleteProtocol {
        Delete(dictionary: Dictionary(), terminalOutput: TerminalOutput(dictionary: Dictionary()))
    }
    var message: TerminalOutputProtocol {
        TerminalOutput(dictionary: Dictionary())
    }
    
}

public func localisationHelper() -> Int {
    
    let container = Container()

    let arguments = container.argumentsParser.parse(nil)
    
    var result = ValidationResult.SomethingGoWrong
    
    if case .search(let key, let language) = arguments {
        container.search.search(key: key, language: language)
        result = .SuccessfullSearch
    } else if case .update(let word, let key, let language) = arguments {
        container.update.update(newWord: word, key: key, language: language)
        result = .SuccessfullUpdate
    } else if case .delete(let key, let language) = arguments {
        container.delete.delete(key: key, language: language)
        result = .SuccessfullDelete
    } else if case .help(let message) = arguments {
        container.message.consoleOutput(word: message)
        result = .SuccessfullHelpMessage
    }
    
    guard result != .SomethingGoWrong else {
        return 1
    }
    
    return 0
}
