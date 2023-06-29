import Foundation

public struct Environment {
    public static func getValue(for key: EnvironmentKey) throws -> String {
        let proccessInfo = ProcessInfo.processInfo
        guard let value = proccessInfo.environment[key.rawValue] else {
            throw EnvironmentError.missingKey
        }
        return value
    }
}

public enum EnvironmentKey: String {
    case apiKey = "API_KEY"
}

public enum EnvironmentError: Error {
    case missingKey
}
