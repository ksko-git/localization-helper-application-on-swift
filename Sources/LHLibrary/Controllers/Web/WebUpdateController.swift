//
//  WebUpdateController.swift
//  
//
//  Created by Ксюся on 12.12.2020.
//

import Fluent
import Vapor
import Leaf

struct WebUpdateController: RouteCollection {
    
    let update: UpdateProtocol
    
    init(update: UpdateProtocol) {
        self.update = update
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /updateResultView...
        let group = routes.grouped("updateResultView")
        group.get(use: updateResultView)
    }
    
    func updateResultView(req: Request) -> EventLoopFuture<View> {

        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Update request. Parameters: newWord = \(parameters?.newWord ?? "") key = \(parameters?.key ?? "") language = \(parameters?.language ?? "")")
        
        let result = update.update(
            newWord: parameters?.newWord,
            key: parameters?.key,
            language: parameters?.language
        ).mapError{ $0 as Error }
        
        let res = result.map { value in
            Response(
                results: value.map { value in
                    Response.UpdateResults(
                        key: value.key,
                        elements: value.value.map {
                            Response.UpdateResults.Element(
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
                return req.view.render("updateResultView", WebUpdateViewContext(title: "🌝 Результаты изменения 🌝", results: dict))
            }
        }
        return req.view.render("updateResultView", ["title": "🌝 Результаты изменения 🌝"])

    }
    
}

struct WebUpdateViewContext: Content {
    var title: String
    var results: WebUpdateController.Response
}

extension WebUpdateController {
    struct Response: Content {
        let results: [UpdateResults]

        struct UpdateResults: Codable {
            let key: String
            let elements: [Element]

            struct Element: Codable {
                let language: String
                let value: String
            }
        }
    }
}

private extension WebUpdateController {
    struct Parameters: Content {
        let newWord: String?
        let key: String?
        let language: String?
    }
}
