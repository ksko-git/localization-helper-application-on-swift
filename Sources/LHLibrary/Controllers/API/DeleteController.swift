//
//  DeleteController.swift
//  
//
//  Created by Ксюся on 05.12.2020.
//

import Vapor

struct DeleteController: RouteCollection {
    
    let delete: DeleteProtocol
    
    init(delete: DeleteProtocol) {
        self.delete = delete
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /deleteAPI...
        let group = routes.grouped("deleteAPI")
        group.get(use: deleteAPI)
    }
    
    func deleteAPI(req: Request) throws -> EventLoopFuture<[String: [String: String]]> {
        
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
