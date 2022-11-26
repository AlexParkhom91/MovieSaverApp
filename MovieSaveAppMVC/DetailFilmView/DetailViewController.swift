import UIKit
import WebKit

protocol DetailViewProtocol: AnyObject {
    func updateLabels(filmImage: UIImage, nameFilm: String, rating: String, releaseDate: String, textViewText: String, link: String)
}

final class DetailViewController: UIViewController {
    // MARK: - Public
    var presenter: DetailPresenterProtocol!

    // MARK: - Private
    private let scrollView = UIScrollView()
    private let viewForScrollView = UIView()
    private let movieImage = UIImageView()
    private let informationView = UIView()
    private let nameMovieLabel = UILabel()
    private let ratingLabel = UILabel()
    private let starImage = UIImageView()
    private let dateLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let trailerWebView = WKWebView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI()
    }

    // MARK: - Setups
    // MARK: - Setup Subviews
    private func setupSubviews() {
        [movieImage, informationView, nameMovieLabel, ratingLabel, dateLabel, descriptionTextView, starImage, scrollView, viewForScrollView].forEach { view.addSubview($0) }
        viewForScrollView.addSubview(trailerWebView)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 286).isActive = true

        informationView.translatesAutoresizingMaskIntoConstraints = false
        informationView.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: -90).isActive = true
        informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        informationView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: informationView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: informationView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: informationView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: informationView.bottomAnchor).isActive = true

        viewForScrollView.translatesAutoresizingMaskIntoConstraints = false
        viewForScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        viewForScrollView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewForScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        viewForScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        viewForScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        viewForScrollView.heightAnchor.constraint(equalToConstant: 630).isActive = true

        nameMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        nameMovieLabel.topAnchor.constraint(equalTo: viewForScrollView.topAnchor, constant: 15).isActive = true
        nameMovieLabel.leadingAnchor.constraint(equalTo: viewForScrollView.leadingAnchor, constant: 19).isActive = true
        nameMovieLabel.trailingAnchor.constraint(equalTo: viewForScrollView.trailingAnchor, constant: -19).isActive = true
        nameMovieLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true

        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 18).isActive = true
        starImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        starImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        starImage.heightAnchor.constraint(equalToConstant: 16).isActive = true

        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 14).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -280).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 20).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 101).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 138).isActive = true

        trailerWebView.translatesAutoresizingMaskIntoConstraints = false
        trailerWebView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 24).isActive = true
        trailerWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        trailerWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        trailerWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52).isActive = true
    }

    // MARK: - Configure UI
    private func configureUI() {
        view.backgroundColor = .white

        informationView.backgroundColor = .white
        informationView.layer.cornerRadius = 16

        starImage.image = UIImage(named: "Star")
        nameMovieLabel.font = UIFont(name: "Manrope-Light", size: 24)
        nameMovieLabel.numberOfLines = 2

        ratingLabel.font = UIFont(name: "Manrope-Light", size: 14)
        descriptionTextView.isEditable = false
        descriptionTextView.font = UIFont(name: "Manrope-Light", size: 14)
    }
}

// MARK: - DetailProtocol
extension DetailViewController: DetailViewProtocol {
    func updateLabels(filmImage: UIImage, nameFilm: String, rating: String, releaseDate: String, textViewText: String, link: String) {
        movieImage.image = filmImage
        nameMovieLabel.text = nameFilm
        ratingLabel.text = "\(rating)/10"
        dateLabel.text = releaseDate
        descriptionTextView.text = textViewText
        trailerWebView.load(URLRequest(url: URL(string: link)!))
    }
}
