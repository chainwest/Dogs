import Foundation

extension NetworkService: DogsNetworkProtocol {
    func getDogsImages(completion: @escaping (Result<DogsResponse, NetworkError>) -> Void) {
        baseRequest(
            url: URLFactory.Dogs.tenDogs,
            method: .get,
            headers: nil,
            completion: completion
        )
    }
}
