import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) async throws {
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(ExtendPathMiddleware())
    
    let modules: [ModuleInterface] = [
        WebModule(),
        BlogModule(),
    ]
    
    for module in modules {
        try module.boot(app)
    }
    
    try app.autoMigrate().wait()
}
