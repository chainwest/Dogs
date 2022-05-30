import Foundation

final class DI {
    let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    static func makeDefaultAssembly() -> DI {
        DI(
            networkService: NetworkService()
        )
    }
}
