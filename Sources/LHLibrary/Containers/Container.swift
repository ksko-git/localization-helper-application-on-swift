//
//  Container.swift
//
//
//  Created by Ксюся on 04.12.2020.
//

import Vapor

public class Container {
    
    var dict: DictionaryProtocol
    var webSearchFormController: WebSearchFormController
    var webUpdateFormController: WebUpdateFormController
    var webDeleteFormController: WebDeleteFormController
    
    init() {
        self.dict = Dictionary()
        self.webSearchFormController = WebSearchFormController()
        self.webUpdateFormController = WebUpdateFormController()
        self.webDeleteFormController = WebDeleteFormController()
    }
    
    var message: TerminalOutputProtocol {
        TerminalOutput()
    }
    var argumentsParser: ArgumentsParserProtocol {
        ArgumentsParser()
    }
    var search: SearchProtocol {
        Search(dictionary: dict)
    }
    var update: UpdateProtocol {
        Update(dictionary: dict)
    }
    var delete: DeleteProtocol {
        Delete(dictionary: dict)
    }

    var searchController: SearchController {
        SearchController(search: Search(dictionary: dict))
    }
    
    var deleteController: DeleteController {
        DeleteController(delete: Delete(dictionary: dict))
    }
    
    var updateController: UpdateController {
        UpdateController(update: Update(dictionary: dict))
    }
    
    var webSearchController: WebSearchController {
        WebSearchController(search: Search(dictionary: dict))
    }
    
    var webUpdateController: WebUpdateController {
        WebUpdateController(update: Update(dictionary: dict))
    }
    
    var webDeleteController: WebDeleteController {
        WebDeleteController(delete: Delete(dictionary: dict))
    }
    
}

extension Application {
    var runContainer: Container {
        .init()
    }
}
