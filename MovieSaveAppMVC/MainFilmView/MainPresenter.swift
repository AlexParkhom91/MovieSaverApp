import Foundation

protocol MainPresenterProtocol {
    var filmGetting: [Film] { get }
    func openDetailView(model: Film)
    func openNewFilmView()
    func reloadCoreData()
}

final class MainPresenter {
    // MARK: - Public
    unowned var view: MainViewProtocol

    // MARK: - Private
    private let coreManager: CoreDataManagerProtocol

    // MARK: - Private
    private let router: MainRouterProtocol

    // MARK: - Variables
    var filmGetting = [Film]() {
        didSet {
            view.reloadDataTable()
        }
    }

    init(view: MainViewProtocol, router: MainRouterProtocol, manager: CoreDataManagerProtocol) {
        self.view = view
        self.router = router
        self.coreManager = manager
    }
}

// MARK: - Extension
extension MainPresenter: MainPresenterProtocol {
    func openDetailView(model: Film) {
        router.openDetailView(model: model)
    }

    func openNewFilmView() {
        router.openNewFilmView()
    }

    func reloadCoreData() {
        filmGetting = coreManager.getFilm()
    }
}
