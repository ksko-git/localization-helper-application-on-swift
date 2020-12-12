//
//  WebDeleteFormController.swift
//  
//
//  Created by Ксюся on 12.12.2020.
//

import Fluent
import Vapor
import Leaf

struct WebDeleteFormController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        // /deleteForm...
        let group = routes.grouped("deleteForm")
        group.get(use: deleteForm)
    }
    
    func deleteForm(req: Request) -> EventLoopFuture<View> {
        
        return req.view.render("deleteForm")

    }
    
}
