import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(ExtendPathMiddleware())
    
    let routers: [RouteCollection] = [
        WebRouter(),
        BlogRouter(),
    ]

    // register routes
    for router in routers {
        try router.boot(routes: app.routes)
    }
}
