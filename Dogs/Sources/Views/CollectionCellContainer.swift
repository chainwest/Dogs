import UIKit

final class CollectionCellContainer<View: UIView>: UICollectionViewCell {
    public private(set) lazy var containedView: View = View(frame: .zero)

    override var isHighlighted: Bool {
        didSet {
            if let selectableView = containedView as? SelectableView {
                selectableView.setSelected(isSelected: isHighlighted, animated: true)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder _: NSCoder) {
        assertionFailure()
        return nil
    }

    private func setup() {
        addShadow(
            color: .black,
            offset: .zero,
            opacity: 2,
            blur: 6
        )
        contentView.addSubview(containedView)
        containedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
