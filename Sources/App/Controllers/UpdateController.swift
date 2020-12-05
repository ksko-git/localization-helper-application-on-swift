//
//  UpdateController.swift
//  
//
//  Created by Ксюся on 05.12.2020.
//

import Fluent
import Vapor

struct UpdateController: RouteCollection {
    
    let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /update...
        let group = routes.grouped("update")
        group.get(use: update)
    }

    func update(req: Request) -> EventLoopFuture<[String: [String: String]]> {

        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Update request. Parameters: newWord = \(parameters?.newWord ?? "") key = \(parameters?.key ?? "") language = \(parameters?.language ?? "")")
        
        let result = container.update.update(
            newWord: parameters?.newWord,
            key: parameters?.key,
            language: parameters?.language
        ).mapError{ $0 as Error }
        
        return req.eventLoop.future(result: result)

    }
    
}

private extension UpdateController {
    struct Parameters: Content {
        let newWord: String?
        let key: String?
        let language: String?
    }
}
