import Vapor
import FluentSQLite


/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<User> {
        return try req.content.decode(User.self).flatMap { todo in
            return todo.save(on: req)
        }
    }
    
    //This method will execute when user hit the API todos/login
    //Because we have connected this method with endpoint todos/login in routes file at line 14
    func login(_ req: Request) throws -> Future<User> {
        //LoginRequest is a class develop to map the requested body to this class in below
        
        return try req.content.decode(LoginRequest.self).flatMap { todo in
            //Check if email exists in request body
            //Remove Optional from LoginRequest to show default message on missing parameters
            guard let email = todo.email else {
                throw Abort(.notFound, reason: "User Email is missing")
            }
            //Check if password exists in request body
            guard let password = todo.password else {
                throw Abort(.notFound, reason: "User Password is missing")
            }
            let result = User.query(on: req).filter(\User.email == email).first().map(to: User.self) { user in
                guard let user = user else {
                    throw Abort(.notFound, reason: "Could not find user.")
                }
                if user.password == password {
                    return user
                }
                throw Abort(.notFound, reason: "Password did not matched")
            }
            return result
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(User.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
}
