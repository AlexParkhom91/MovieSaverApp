import UIKit
import WebKit

final class DetailMovieViewController: UIViewController {
    // MARK: - Identifier
    // MARK: - Properties

    // MARK: Public

    var film: Film = .init(name: "", rating: "", date: "", link: "", image: Data(), description: "")
    var currentFilm: Film?

    // MARK: Private

    private let scrollView = UIScrollView()
    private let viewForScrollView = UIView()
    private let movieImage = UIImageView()
    private let starImage = UIImageView()
    private let mainView = UIView()
    private let nameMovieLabel = UILabel()
    private let ratingLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let trailerWebView = WKWebView()

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        addSetupsUI()
        addInfoMovie()
        SetupTrailerWebView()
        movieImage.image = UIImage(data: currentFilm?.image ?? Data())
    }

    private func SetupTrailerWebView() {
        let url = URL(string: currentFilm?.link ?? "")
        let request = URLRequest(url: url!)
        trailerWebView.load(request)
    }

    // MARK: - Constraints

    // MARK: Private

    private func addConstraints() {
        addMovieImageConstraint()
        addMainViewConstraint()
        addScrollViewConstraint()
        addViewForScrollViewConstraint()
        addNameMovieLabelConstraint()
        addRatingConstraint()
        addDescriptionTextViewConstraint()
        addTrailerWebViewConstraint()
        addDateLabelConstraint()
        addfilmImageViewConstraint()
    }

    private func addMovieImageConstraint() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 286).isActive = true
    }

    private func addMainViewConstraint() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: -90).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func addScrollViewConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }

    private func addViewForScrollViewConstraint() {
        viewForScrollView.translatesAutoresizingMaskIntoConstraints = false
        viewForScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        viewForScrollView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewForScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        viewForScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        viewForScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        viewForScrollView.heightAnchor.constraint(equalToConstant: 630).isActive = true
    }

    private func addNameMovieLabelConstraint() {
        nameMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        nameMovieLabel.topAnchor.constraint(equalTo: viewForScrollView.topAnchor, constant: 15).isActive = true
        nameMovieLabel.leadingAnchor.constraint(equalTo: viewForScrollView.leadingAnchor, constant: 19).isActive = true
        nameMovieLabel.trailingAnchor.constraint(equalTo: viewForScrollView.trailingAnchor, constant: -19).isActive = true
        nameMovieLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }

    private func addfilmImageViewConstraint() {
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 18).isActive = true
        starImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }

    private func addRatingConstraint() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 14).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -280).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func addDateLabelConstraint() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 20).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 101).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func addDescriptionTextViewConstraint() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 138).isActive = true
    }
    private func addTrailerWebViewConstraint() {
        trailerWebView.translatesAutoresizingMaskIntoConstraints = false
        trailerWebView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 24).isActive = true
        trailerWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        trailerWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        trailerWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    // MARK: Private

    private func addSubviews() {
        view.addSubview(movieImage)
        view.addSubview(mainView)
        view.addSubview(scrollView)
        view.addSubview(viewForScrollView)
        view.addSubview(nameMovieLabel)
        view.addSubview(ratingLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(dateLabel)
        view.addSubview(starImage)
        viewForScrollView.addSubview(trailerWebView)
    }

    private func addSetupsUI() {
        addMainViewUI()
        addMovieImageUI()
        addNameMovieLabelUI()
        addRatingLabelUI()
        addDescriptionTextViewUI()
        addStarImage()
    }

    private func addMovieImageUI() {
        movieImage.contentMode = .scaleAspectFill
    }
    private func addMainViewUI() {
        mainView.layer.cornerRadius = 16
        mainView.backgroundColor = .white
    }
    private func addNameMovieLabelUI() {
        nameMovieLabel.numberOfLines = 2
        nameMovieLabel.textColor = .black
        nameMovieLabel.font = UIFont(name: "Manrope-Light", size: 24)
    }

    private func addRatingLabelUI() {
        ratingLabel.textColor = .black
    }
    private func addDescriptionTextViewUI() {
        descriptionTextView.textColor = .black
        descriptionTextView.font = UIFont(name: "Manrope-Light", size: 14)
        descriptionTextView.isEditable = false
    }

    // MARK: - Helpers

    // MARK: Private

    private func addInfoMovie() {
        nameMovieLabel.text = film.name
        descriptionTextView.text = film.description
        ratingLabel.text = "\(film.rating)/10"
        dateLabel.text = "\(film.date)"
        dateLabel.font = UIFont(name: "Manrope-Light", size: 8)
    }

    private func addStarImage() {
        starImage.image = UIImage(named: "Star")
    }
}
