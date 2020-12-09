//
//  DeleteController.swift
//  
//
//  Created by Ксюся on 05.12.2020.
//

import Fluent
import Vapor

struct DeleteController: RouteCollection {
    
    let delete: DeleteProtocol
    
    init(delete: DeleteProtocol) {
        self.delete = delete
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /delete...
        let group = routes.grouped("delete")
        group.get(use: delete)
    }
    
    func delete(req: Request) throws -> EventLoopFuture<[String: [String: String]]> {
        
        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Delete request. Parameters: key = \(parameters?.key ?? "") language = \(parameters?.language ?? "")")
        
        let result = delete.delete(key: parameters?.key, language: parameters?.language).mapError{ $0 as Error }
        
        return req.eventLoop.future(result: result)
        
    }
    
}

private extension DeleteController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}
