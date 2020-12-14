//
//  WebSearchController.swift
//  
//
//  Created by Ксюся on 11.12.2020.
//

import Fluent
import Vapor
import Leaf

struct WebSearchController: RouteCollection {
    
    let search: SearchProtocol
    
    init(search: SearchProtocol) {
        self.search = search
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /searchResultView...
        let group = routes.grouped("searchResultView")
        group.get(use: searchResultView)
    }
    
    func searchResultView(req: Request) -> EventLoopFuture<View> {

        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Search request. Parameters: key = \(parameters?.key ?? "") language = \(parameters?.language ?? "")")
        let result = search.search(key: parameters?.key, language: parameters?.language)
            .mapError{ $0 as Error }
        
        let res = result.map { value in
            Response(
                results: value.map { value in
                    Response.SearchResults(
                        key: value.key,
                        elements: value.value.map {
                            Response.SearchResults.Element(
                                language: $0.key,
                                value: $0.value
                            )
                        }
                    )
                }
            )
        }
        
        if case .success(_) = result {
            if case .success(let dict) = res {
                return req.view.render("searchResultView", WebSearchViewContext(title: "🌝 Результаты поиска 🌝", results: dict))
            }
        }
        return req.view.render("searchResultView", ["title": "🌝 Результаты поиска 🌝"])

    }
    
}

struct WebSearchViewContext: Content {
    var title: String
    var results: WebSearchController.Response
}

extension WebSearchController {
    struct Response: Content {
        let results: [SearchResults]

        struct SearchResults: Codable {
            let key: String
            let elements: [Element]

            struct Element: Codable {
                let language: String
                let value: String
            }
        }
    }
}

private extension WebSearchController {
    struct Parameters: Content {
        let key: String?
        let language: String?
    }
}
