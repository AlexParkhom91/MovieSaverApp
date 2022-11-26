import UIKit

protocol DateReleaseRouterProtocol {
    func backToNewFilmView()
}

final class DateReleaseRouter: DateReleaseRouterProtocol {
    let navigationController: UINavigationController
    let completion: (Date) -> Void

    init(navigationController: UINavigationController, completion: @escaping ((Date) -> Void)) {
        self.navigationController = navigationController
        self.completion = completion
        let view = DateReleaseViewController()
        let presenter = DateReleasePresenter(view: view, router: self)
        view.presenter = presenter
        presenter.selectedDateCallback = { [weak self] in
            self?.completion($0)
        }
        navigationController.pushViewController(view, animated: true)
    }

    func backToNewFilmView() {
        navigationController.popViewController(animated: true)
    }
}
