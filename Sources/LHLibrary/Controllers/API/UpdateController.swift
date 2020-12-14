//
//  UpdateController.swift
//  
//
//  Created by Ксюся on 05.12.2020.
//

import Fluent
import Vapor

struct UpdateController: RouteCollection {
    
    let update: UpdateProtocol
    
    init(update: UpdateProtocol) {
        self.update = update
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /updateAPI...
        let group = routes.grouped("updateAPI")
        group.get(use: updateAPI)
    }

    func updateAPI(req: Request) -> EventLoopFuture<[String: [String: String]]> {

        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Update request. Parameters: newWord = \(parameters?.newWord ?? "") key = \(parameters?.key ?? "") language = \(parameters?.language ?? "")")
        
        let result = update.update(
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
