import Foundation

final class CollectionViewModel {
    private let dependencies: DI

    var onDidUpdate: (() -> Void)?

    private(set) var cellViewModels = [CollectionCellViewModel]()

    init(dependencies: DI) {
        self.dependencies = dependencies
    }

    func getCellViewModels() {
        dependencies.networkService.getDogsImages { [weak self] response in
            switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.updateViewModels(with: data)
                    self?.onDidUpdate?()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    private func updateViewModels(with data: DogsResponse) {
        cellViewModels = data.message.map(CollectionCellViewModel.init)
    }
}
