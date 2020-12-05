//
//  localisation-helper.swift
//  
//
//  Created by Ксюся on 17.11.2020.
//

import Foundation
import ArgumentParser

public class Container {
    
    var dict = Dictionary()
    
    var message: TerminalOutputProtocol {
        TerminalOutput()
    }
    var argumentsParser: ArgumentsParserProtocol {
        ArgumentsParser()
    }
    var search: SearchProtocol {
        Search(dictionary: dict, terminalOutput: message)
    }
    var update: UpdateProtocol {
        Update(dictionary: dict, terminalOutput: message)
    }
    var delete: DeleteProtocol {
        Delete(dictionary: dict, terminalOutput: message)
    }
    
}

public func localisationHelper() -> Result<[String : [String : String]], ValidationResult> {
    
    let container = Container()

    let arguments = container.argumentsParser.parse(nil)
    
    if case .search(let key, let language) = arguments {
        return container.search.search(key: key, language: language)
    } else if case .update(let word, let key, let language) = arguments {
        return container.update.update(newWord: word, key: key, language: language)
    } else if case .delete(let key, let language) = arguments {
        return container.delete.delete(key: key, language: language)
    } else if case .help(let message) = arguments {
        container.message.consoleOutput(word: message)
    }
    return .failure(.somethingWentWrong)
}
