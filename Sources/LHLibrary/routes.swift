import Fluent
import Vapor
import Leaf
import LeafKit

func routes(_ app: Application) throws {
    // MAIN
    app.get() { req -> EventLoopFuture<View> in
        return req.view.render("index")
    }
    // WEB
    try? app.register(collection: app.runContainer.webSearchFormController)
    try? app.register(collection: app.runContainer.webSearchController)
    try? app.register(collection: app.runContainer.webUpdateFormController)
    try? app.register(collection: app.runContainer.webUpdateController)
    try? app.register(collection: app.runContainer.webDeleteFormController)
    try? app.register(collection: app.runContainer.webDeleteController)
    // API
    try? app.register(collection: app.runContainer.searchController)
    try? app.register(collection: app.runContainer.deleteController)
    try? app.register(collection: app.runContainer.updateController)
    
    app.get("dictionary") { req -> EventLoopFuture<[DictionaryTable]> in
        let dict = DictionaryTable.query(on: req.db)
            .field(\.$englishword).field(\.$language).field(\.$translation).sort(\.$englishword).all()
        
        return dict
    }
    
    app.post("dictionary") { req -> EventLoopFuture<DictionaryTable> in
        let dictionary = try req.content.decode(DictionaryTable.self)
        return dictionary.create(on: req.db).map { dictionary }
    }
    
}
