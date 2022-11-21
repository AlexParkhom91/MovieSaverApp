import CoreData
import UIKit

class MovieViewController: UIViewController {

    // MARK: Private
    private let movieViewTable = UITableView()
    var films = [Film]() { didSet { movieViewTable.reloadData() }}

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        films = CoreDataManager.instance.get()
    }

    // MARK: - Constraints

    private func setupSubviews() {
        view.addSubview(movieViewTable)
        setupConstraints()
        addNavigationControllerUI()
        movieViewTable.register(MovieInfoTableViewCell.self, forCellReuseIdentifier: MovieInfoTableViewCell.identifier)
    }

    private func setupConstraints() {
        movieViewTable.translatesAutoresizingMaskIntoConstraints = false
        movieViewTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieViewTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieViewTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieViewTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        movieViewTable.delegate = self
        movieViewTable.dataSource = self
        movieViewTable.layer.shadowColor = .init(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
    }

    private func addNavigationControllerUI() {
        title = "Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(moveToAddMovieScreenDidTapped)
        )
    }

    @objc func moveToAddMovieScreenDidTapped() {
        let vc = AddMovieViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = movieViewTable.dequeueReusableCell(withIdentifier: MovieInfoTableViewCell.identifier, for: indexPath) as? MovieInfoTableViewCell {
            let film = films[indexPath.row]
            cell.setInfoMovie(
                NameMovie: film.name,
                RatingMovie: film.rating,
                ImageMovie: film.image
            )

            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        212
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScreenVC = DetailMovieViewController()
        detailScreenVC.film = films[indexPath.item]

        detailScreenVC.currentFilm = films[indexPath.item]
        navigationController?.pushViewController(detailScreenVC, animated: true)
    }
}
