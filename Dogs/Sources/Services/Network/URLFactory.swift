import Foundation

enum URLFactory {
    private static let base = "https://dog.ceo/api"

    enum Dogs {
        static let tenDogs = base + "/breeds/image/random/10"
    }
}
