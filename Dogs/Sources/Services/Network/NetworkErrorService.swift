import Foundation

enum NetworkError: String, Error {
    case badURL = "Bad url"
    case responseError = "Response error"
    case emptyData = "Empty data response"
}
