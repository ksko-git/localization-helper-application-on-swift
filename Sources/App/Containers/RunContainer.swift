//
//  RunContainer.swift
//  
//
//  Created by Ксюся on 04.12.2020.
//

import Foundation
import Vapor

public class RunContainer {

    var searchController: SearchController {
        SearchController(container: Manager())
    }
    
    var deleteController: DeleteController {
        DeleteController(container: Manager())
    }
    
    var updateController: UpdateController {
        UpdateController(container: Manager())
    }
    
}

extension Application {
    var runContainer: RunContainer {
        .init()
    }
}
