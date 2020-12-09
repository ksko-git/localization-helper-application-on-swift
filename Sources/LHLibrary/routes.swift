import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.get() { req in
        return "Hi!"
    }
    
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
