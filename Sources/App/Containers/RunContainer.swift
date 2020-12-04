//
//  RunContainer.swift
//  
//
//  Created by Ксюся on 04.12.2020.
//

import Foundation
import ArgumentParser
import Vapor

public class RunContainer {
    
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
    
    
    
    
    var searchController: SearchController {
        SearchController(
            
//            LocalizationManager: AppContainer.Managers.localization()
        )
    }
    
}

extension Application {
    var container: Container {
        .init()
    }
}
