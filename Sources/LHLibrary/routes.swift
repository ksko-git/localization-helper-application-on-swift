import Vapor

func routes(_ app: Application) throws {
    // MAIN
    app.get() { req in
        return "Hi!"
    }
    // API
    try? app.register(collection: app.runContainer.searchController)
    try? app.register(collection: app.runContainer.deleteController)
    try? app.register(collection: app.runContainer.updateController)
    
}
