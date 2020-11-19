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
        Search(dictionary: Dictionary(), terminalOutput: TerminalOutput())
    }
    var update: UpdateProtocol {
        Update(dictionary: Dictionary(), terminalOutput: TerminalOutput())
    }
    var delete: DeleteProtocol {
        Delete(dictionary: Dictionary(), terminalOutput: TerminalOutput())
    }
    var message: TerminalOutputProtocol {
        TerminalOutput()
    }
    
}

public func localisationHelper() -> Int {
    
    let container = Container()

    let arguments = container.argumentsParser.parse(nil)
    
    var result = ValidationResult.SomethingGoWrong
    
    if case .search(let key, let language) = arguments {
        result = container.search.search(key: key, language: language)
    } else if case .update(let word, let key, let language) = arguments {
        result = container.update.update(newWord: word, key: key, language: language)
    } else if case .delete(let key, let language) = arguments {
        result = container.delete.delete(key: key, language: language)
    } else if case .help(let message) = arguments {
        container.message.consoleOutput(word: message)
        result = .SuccessfullHelpMessage
    }
    
    guard result != .SomethingGoWrong else {
        return 1
    }
    
    return 0
}
