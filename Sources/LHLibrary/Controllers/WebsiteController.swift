//
//  WebsiteController.swift
//  
//
//  Created by Ксюся on 11.12.2020.
//

import Fluent
import Vapor
import Leaf

struct WebsiteController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let group = routes.grouped("index")
        group.get(use: index)
    }
    
    func index(req: Request) throws -> EventLoopFuture<View> {
        
        return req.view.render("index")
        
    }
    
}


