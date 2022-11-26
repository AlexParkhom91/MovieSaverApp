import Foundation
import UIKit

protocol AddFilmPresenterProtocol {
    func saveFilm(name: String, releaseDate: String, rating: String, link: String, imageFromLibrary: UIImage, descriptionText: String)
    func backToMainView()
    func openNameView()
    func openRatingView()
    func openReleaseDateView()
    func openUrlLinkView()
}

final class AddFilmPresenter: AddFilmPresenterProtocol {

    // MARK: - Public
    unowned var view: AddFilmViewProtocol
    private let coreManager: CoreDataManagerProtocol

    // MARK: - Private
    private let router: AddFilmRouterProtocol

    init(view: AddFilmViewProtocol, router: AddFilmRouterProtocol, coreManager: CoreDataManagerProtocol) {
        self.view = view
        self.router = router
        self.coreManager = coreManager
    }

    func saveFilm(name: String, releaseDate: String, rating: String, link: String, imageFromLibrary: UIImage, descriptionText: String) {
        if name != "-",
           releaseDate != "-",
           rating != "-",
           link != "-",
           imageFromLibrary != UIImage(named: "backgroundImage"),
           descriptionText != ""
        {
            let film = Film(date: releaseDate,
                            image: (imageFromLibrary.pngData())!,
                            name: name, ratings: rating,
                            link: link, discription: descriptionText)
            coreManager.saveFilm(film)
        } else {
            view.showErrorAlert()
        }
    }

    func backToMainView() {
        router.saveModelAndBack()
    }

    func openNameView() {
        router.openNameView { [weak self] text in
            self?.view.updateNameLabel(text: text)
        }
    }

    func openRatingView() {
        router.openRatingView { [weak self] text in
            self?.view.updateRatingLabel(rating: text)
        }
    }

    func openUrlLinkView() {
        router.openLinkView { [weak self] text in
            self?.view.updateLinkLabel(url: text)
        }
    }

    func openReleaseDateView() {
        router.openDateView { [weak self] date in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            self?.view.updateDateLabel(date: dateFormatter.string(from: date))
        }
    }
}
