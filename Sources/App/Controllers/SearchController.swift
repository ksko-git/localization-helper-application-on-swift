//
//  SearchController.swift
//  
//
//  Created by Ксюся on 03.12.2020.
//

import Fluent
import Vapor

struct SearchController: RouteCollection {
    
//    let searchFunc = SearchProtocol
    let container = Container()
    
//    init(searchFunc: SearchProtocol) {
//        self.searchFunc = searchFunc
//    }
    
    func boot(routes: RoutesBuilder) throws {
        let group = routes.grouped("search")
//        group.get(use: search)
    }
//
//    func search(req: Request) -> EventLoopFuture<[String: [String: String]]> {
//
//        let parameters = try? req.query.decode(Parameters.self)
//
//        req.logger.info("Parameters: key = \(parameters?.key ?? "") language = \(parameters?.language ?? "")")
//
//        let result = container.search.search(key: parameters?.key, language: parameters?.language)
//
//        return req.eventLoop.future(result: ["hello": ["en": "hehe"]])
//
//    }
    
}

private extension SearchController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}
