import UIKit

protocol DetailRouterProtocol {}

final class DetailRouter: DetailRouterProtocol {
    let navigationController: UINavigationController
    let filmModel: Film

    init(navigationController: UINavigationController, filmModel: Film) {
        self.navigationController = navigationController
        self.filmModel = filmModel
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, router: self, filmModel: filmModel)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}
