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

public func main() {
    
    let container = Container()

    let arguments = container.argumentsParser.parse()
    
    if case .search(let key, let language) = arguments {
        container.search.search(key: key, language: language)
    } else if case .update(let word, let key, let language) = arguments {
        container.update.update(newWord: word, key: key, language: language)
    } else if case .delete(let key, let language) = arguments {
        container.delete.delete(key: key, language: language)
    } else if case .help(let message) = arguments {
        container.message.consoleOutput(word: message)
    }
    
}
