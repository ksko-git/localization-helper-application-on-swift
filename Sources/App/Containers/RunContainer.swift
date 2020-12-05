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
        SearchController(container: Container())
    }
    
}

extension Application {
    var runContainer: RunContainer {
        .init()
    }
}
