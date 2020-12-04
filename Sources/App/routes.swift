import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    app.get() { req -> [String: [String: String]] in
        
        let container = Container()
        
//        let res = container.search.search(key: nil, language: "pt")
//        let res = container.update.update(newWord: "cat", key: "cat", language: "en")
        let res = container.delete.delete(key: "hello", language: "en")
        
        return res
    }
    
//    app.register(collection: app.container.searchController)
//    app.register(collection: app.container.updateController)
//    app.register(collection: app.container.deleteController)
    
    app.get("dictionary") { req -> EventLoopFuture<[DictionaryTable]> in

        let dict = DictionaryTable.query(on: req.db)
            .field(\.$englishword).field(\.$language).field(\.$translation).sort(\.$englishword).all()
        
        return dict
    }
    
    app.post("dictionary") { req -> EventLoopFuture<DictionaryTable> in
        let dictionary = try req.content.decode(DictionaryTable.self)
        return dictionary.create(on: req.db).map { dictionary }
    }
    
//    try app.register.(collection: app.container.searchController)
    
}
