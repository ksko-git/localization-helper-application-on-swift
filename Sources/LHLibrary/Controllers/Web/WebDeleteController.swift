//
//  WebDeleteController.swift
//
//
//  Created by Ксюся on 12.12.2020.
//

import Fluent
import Vapor
import Leaf

struct WebDeleteController: RouteCollection {
    
    let delete: DeleteProtocol
    
    init(delete: DeleteProtocol) {
        self.delete = delete
    }
    
    func boot(routes: RoutesBuilder) throws {
        // /deleteResultView...
        let group = routes.grouped("deleteResultView")
        group.get(use: deleteResultView)
    }
    
    func deleteResultView(req: Request) -> EventLoopFuture<View> {

        let parameters = try? req.query.decode(Parameters.self)
        req.logger.info("Delete request. Parameters: key = \(parameters?.deleteKey ?? "") language = \(parameters?.deleteLanguage ?? "")")
        
        let result = delete.delete(key: parameters?.deleteKey, language: parameters?.deleteLanguage).mapError{ $0 as Error }
        
        let res = result.map { value in
            Response(
                results: value.map { value in
                    Response.DeleteResults(
                        key: value.key,
                        elements: value.value.map {
                            Response.DeleteResults.Element(
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
                return req.view.render("deleteResultView", WebDeleteViewContext(title: "🌝 Результаты удаления 🌝", results: dict))
            }
        }
        return req.view.render("deleteResultView", ["title": "🌝 Результаты удаления 🌝"])

    }
    
}

struct WebDeleteViewContext: Content {
    var title: String
    var results: WebDeleteController.Response
}

extension WebDeleteController {
    struct Response: Content {
        let results: [DeleteResults]

        struct DeleteResults: Codable {
            let key: String
            let elements: [Element]

            struct Element: Codable {
                let language: String
                let value: String
            }
        }
    }
}

private extension WebDeleteController {
    struct Parameters: Content {
        let deleteKey: String?
        let deleteLanguage: String?
    }
}
