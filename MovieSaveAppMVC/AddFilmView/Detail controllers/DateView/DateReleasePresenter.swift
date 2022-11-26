import Foundation

protocol DateReleasePresenterProtocol {
    func backToNewFilmView()
    var selectedDateCallback: ((Date) -> Void)? { get }
}

final class DateReleasePresenter {
    // MARK: - Public
    unowned var view: DateReleaseViewProtocol

    // MARK: - Private
    private let router: DateReleaseRouterProtocol
    var selectedDateCallback: ((Date) -> Void)?

    init(view: DateReleaseViewProtocol, router: DateReleaseRouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - Extension
extension DateReleasePresenter: DateReleasePresenterProtocol {
    func backToNewFilmView() {
        router.backToNewFilmView()
    }
}
