import Foundation

protocol LinkPresenterProtocol {
    func backToNewFilmView()
    func saveTextFromTF(text: String)
}

final class LinkPresenter {
    // MARK: - Public
    unowned var view: LinkViewProtocol
    var textInLinkTextField: ((String) -> Void)?
    // MARK: - Private
    private let router: LinkRouterProtocol

    init(view: LinkViewProtocol, router: LinkRouterProtocol) {
        self.view = view
        self.router = router
    }
}

// MARK: - Extension
extension LinkPresenter: LinkPresenterProtocol {
    func backToNewFilmView() {
        router.backToNewFilmView()
    }

    func saveTextFromTF(text: String) {
        textInLinkTextField?(text)
    }
}
