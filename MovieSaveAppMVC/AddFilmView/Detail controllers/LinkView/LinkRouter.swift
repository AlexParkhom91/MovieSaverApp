import UIKit

protocol LinkRouterProtocol {
    func backToNewFilmView()
}

final class LinkRouter: LinkRouterProtocol {
    let navigationController: UINavigationController
    let completion: (String) -> Void

    init(navigationController: UINavigationController, completion: @escaping (String) -> Void) {
        self.navigationController = navigationController
        let view = LinkViewController()
        self.completion = completion
        let presenter = LinkPresenter(view: view, router: self)
        view.presenter = presenter
        presenter.textInLinkTextField = { [weak self] in
            self?.completion($0)
        }
        navigationController.pushViewController(view, animated: true)
    }

    func backToNewFilmView() {
        navigationController.popViewController(animated: true)
    }
}
