//
//  WebUpdateFormController.swift
//  
//
//  Created by Ксюся on 12.12.2020.
//

import Fluent
import Vapor
import Leaf

struct WebUpdateFormController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        // /updateForm...
        let group = routes.grouped("updateForm")
        group.get(use: updateForm)
    }
    
    func updateForm(req: Request) -> EventLoopFuture<View> {
        
        return req.view.render("updateForm")

    }
    
}
