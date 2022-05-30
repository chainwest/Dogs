import Foundation

final class NetworkService {
    enum RequestMethod: String {
        case get = "GET"
        case post = "POST"
    }

    func baseRequest<T: Decodable>(
        url: String,
        method: RequestMethod,
        headers: [String : String]? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        session.dataTask(with: request) { data, response, error in
            guard error == nil, let data = data else {
                completion(.failure(.responseError))
                return
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.responseError))
            }
        }.resume()
    }
}
