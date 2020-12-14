//
//  SearchController.swift
//  
//
//  Created by Ксюся on 03.12.2020.
//

import Fluent
import Vapor

struct SearchController: RouteCollection {
    
    let search: SearchProtocol
    
    init(search: SearchProtocol) {
        self.search = search
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /searchAPI...
        let group = routes.grouped("searchAPI")
        group.get(use: searchAPI)
    }

    func searchAPI(req: Request) -> EventLoopFuture<[String: [String: String]]> {

        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Search request. Parameters: key = \(parameters?.key ?? "") language = \(parameters?.language ?? "")")
        let result = search.search(key: parameters?.key, language: parameters?.language).mapError{ $0 as Error }
        
        return req.eventLoop.future(result: result)

    }
    
}

private extension SearchController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}
