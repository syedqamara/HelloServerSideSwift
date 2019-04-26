import FluentSQLite
import Vapor
import FluentPostgreSQL
import Leaf


struct ProductionDBConfig {
    static let hostName = "localhost"
    static let database = "myfirstdb"
    static let user = "syedqamar"
    static let password: String? = nil
    static let port = 5432
}

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    
    
    //SQLite configurations
    /*
     try services.register(FluentSQLiteProvider())
     
     /// Register routes to the router
     
     
     /// Register middleware
     
     
     // Configure a SQLite database
     let sqlite = try SQLiteDatabase(storage: .file(path: "/Users/apple/Documents/Projects/HelloServerSideSwift/project.db"))
     /// Register the configured SQLite database to the database config.
     var databases = DatabasesConfig()
     databases.add(database: sqlite, as: .sqlite)
     services.register(databases)
     
     /// Configure migrations
     var migrations = MigrationConfig()
     migrations.add(model: User.self, database: .sqlite)
     migrations.add(model: Product.self, database: .sqlite)
     migrations.add(model: Booking.self, database: .sqlite)
     services.register(migrations)
    */
    
    try services.register(FluentPostgreSQLProvider())
    try services.register(LeafProvider())
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    // Configure a Postgres database
    var databases = DatabasesConfig()
    
    let databaseConfig: PostgreSQLDatabaseConfig
    if let url = Environment.get("DATABASE_URL"), let configObject =  PostgreSQLDatabaseConfig(url: url) {
        databaseConfig = configObject
    }
    else {
        databaseConfig = PostgreSQLDatabaseConfig(hostname: ProductionDBConfig.hostName, port: ProductionDBConfig.port, username: ProductionDBConfig.user, database: ProductionDBConfig.database, password: ProductionDBConfig.password, transport: .cleartext)

    }
    let database = PostgreSQLDatabase(config: databaseConfig)
    databases.add(database: database, as: .psql)
    services.register(databases)
    
    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .psql)
    migrations.add(model: Product.self, database: .psql)
    migrations.add(model: Booking.self, database: .psql)
    migrations.add(model: Deeplink.self, database: .psql)
    services.register(migrations)
    
    
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)

}
