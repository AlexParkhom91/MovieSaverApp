import Foundation
import UIKit

protocol DetailPresenterProtocol {
    func getModelFromMainView()
}

final class DetailPresenter: DetailPresenterProtocol {
    // MARK: - Public
    unowned var view: DetailViewProtocol

    // MARK: - Private
    private let router: DetailRouterProtocol
    private let filmModel: Film

    init(view: DetailViewProtocol, router: DetailRouterProtocol, filmModel: Film) {
        self.view = view
        self.router = router
        self.filmModel = filmModel
        getModelFromMainView()
    }

    func getModelFromMainView() {
        view.updateLabels(filmImage: UIImage(data: filmModel.image)!,
                          nameFilm: filmModel.name,
                          rating: filmModel.ratings,
                          releaseDate: filmModel.date,
                          textViewText: filmModel.discription,
                          link: filmModel.link)
    }
}
