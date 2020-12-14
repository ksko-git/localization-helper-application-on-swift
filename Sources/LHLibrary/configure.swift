import Fluent
import FluentPostgresDriver
import Vapor
import Leaf
import LeafKit

// configures your application
public func configure(_ app: Application) throws {
    
    app.views.use(.leaf)    
    
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "lhdb"), as: .psql)

    app.migrations.add(CreateDictionary())

    // register routes
    try routes(app)
    
    
}
