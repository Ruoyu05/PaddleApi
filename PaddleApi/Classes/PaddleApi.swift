import Foundation

public class PaddleApi {

    public init() {}

    public func greeting() -> String {
        let lib = MyLibrary()
        return lib.greet()
        // return "Hello! I'm PaddleApi."
    }
}
