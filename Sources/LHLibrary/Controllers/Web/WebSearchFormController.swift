//
//  WebSearchFormController.swift
//  
//
//  Created by Ксюся on 11.12.2020.
//

import Fluent
import Vapor
import Leaf

struct WebSearchFormController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        // /searchForm...
        let group = routes.grouped("searchForm")
        group.get(use: searchForm)
    }
    
    func searchForm(req: Request) -> EventLoopFuture<View> {
        
        return req.view.render("searchForm")

    }
    
}
