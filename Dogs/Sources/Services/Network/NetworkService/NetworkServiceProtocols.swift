import Foundation

protocol DogsNetworkProtocol {
    func getDogsImages(completion: @escaping (Result<DogsResponse, NetworkError>) -> Void)
}
