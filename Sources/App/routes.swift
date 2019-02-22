import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("api/users", use: todoController.index)
    router.post("api/register", use: todoController.create)
    router.post("api/login", use: todoController.login)
    
    
    
    // Example of configuring a controller
    let productController = ProductController()
    router.get("api/allproducts", use: productController.index)
    router.post("api/newproduct", use: productController.create)
//    router.delete("users", User.parameter, use: productController.delete)
    
    
    // Example of configuring a controller
    let bookingController = BookingController()
    router.get("api/allbookings", use: bookingController.index)
    router.post("api/newbooking", use: bookingController.create)
    router.post("api/delete", use: bookingController.delete)
}
