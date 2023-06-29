public struct Pagination<T> {
    public let currentPage: Int
    public let totalPages: Int
    public let results: [T]
    
    public init(currentPage: Int, totalPages: Int, results: [T]) {
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.results = results
    }
}
