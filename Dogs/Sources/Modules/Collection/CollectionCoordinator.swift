import UIKit

final class CollectionCoordinator: Coordinator {
    var navigationController: UINavigationController
    var dependencies: DI

    init(
        navigationController: UINavigationController,
        dependencies: DI
    ) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let viewModel = CollectionViewModel(dependencies: dependencies)
        let vc = CollectionViewController(viewModel: viewModel)
        navigationController.setViewControllers([vc], animated: false)
    }
}
