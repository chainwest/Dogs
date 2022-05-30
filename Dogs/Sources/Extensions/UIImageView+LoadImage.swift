import UIKit

extension UIImageView {
    func loadImage(with url: URL?) {
        guard let url = url else {
            image = UIImage()
            return
        }
        let queue = DispatchQueue(label: "imageDownloading", qos: .utility, attributes: .concurrent)

        queue.async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
