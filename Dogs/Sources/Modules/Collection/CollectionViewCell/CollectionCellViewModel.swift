import UIKit

struct CollectionCellViewModel {
    let imageUrl: URL?

    init(imageUrl: String) {
        self.imageUrl = URL(string: imageUrl)
    }
}
