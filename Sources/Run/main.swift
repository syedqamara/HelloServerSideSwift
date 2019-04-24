import App
do {
try app(.detect()).run()
}
catch let error {
    print("Error = \(error.localizedDescription)")
}
