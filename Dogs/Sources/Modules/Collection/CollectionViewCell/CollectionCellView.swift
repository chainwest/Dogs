import UIKit

final class CollectionCellView: UIView, SelectableView {
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        assertionFailure()
        return nil
    }

    func configure(with viewModel: CollectionCellViewModel) {
        imageView.loadImage(with: viewModel.imageUrl)
    }

    func setSelected(isSelected: Bool, animated: Bool) {
        let animation = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.4) {
            self.transform = isSelected ? .init(scaleX: 0.9, y: 0.9) : .identity
        }
        animation.startAnimation()
    }

    private func setup() {
        makeRoundedCorners(radius: 15)
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
