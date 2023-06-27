public enum Failure: Error {
    case cacheFailure(error: String)
    case serverFailure(error: String)
}
