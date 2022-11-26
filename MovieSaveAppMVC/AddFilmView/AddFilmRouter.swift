import UIKit

protocol AddFilmRouterProtocol {
    func openNameView(completion: @escaping ((String) -> Void))
    func openLinkView(completion: @escaping ((String) -> Void))
    func openRatingView(completion: @escaping ((String) -> Void))
    func openDateView(completion: @escaping ((Date) -> Void))
    func saveModelAndBack()
}

final class AddFilmRouter: AddFilmRouterProtocol {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let view = AddFilmViewController()
        let manager = CoreDataManager()
        let presenter = AddFilmPresenter(view: view, router: self, coreManager: manager)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }

    func openNameView(completion: @escaping ((String) -> Void)) {
        _ = NameRouter(navigationController: navigationController, completion: completion)
    }

    func openLinkView(completion: @escaping ((String) -> Void)) {
        _ = LinkRouter(navigationController: navigationController, completion: completion)
    }

    func openRatingView(completion: @escaping ((String) -> Void)) {
        _ = RatingRouter(navigationController: navigationController, completion: completion)
    }

    func openDateView(completion: @escaping ((Date) -> Void)) {
        _ = DateReleaseRouter(navigationController: navigationController, completion: completion)
    }

    func saveModelAndBack() {
        navigationController.popViewController(animated: true)
    }
}
