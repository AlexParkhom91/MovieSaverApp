import UIKit

protocol MainViewProtocol: AnyObject {
    func reloadDataTable()
}

final class MainViewController: UIViewController {
    // MARK: - Public
    var presenter: MainPresenterProtocol!

    // MARK: - Private
    private let filmTable = UITableView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI()
        setupBehavior()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.reloadCoreData()
    }

    // MARK: - Setups
    private func setupSubviews() {
        view.addSubview(filmTable)
    }

    private func setupConstraints() {
        filmTable.translatesAutoresizingMaskIntoConstraints = false
        filmTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        filmTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        filmTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        filmTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        filmTable.delegate = self
        filmTable.dataSource = self
        filmTable.layer.shadowColor = .init(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
    }

    private func configureUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        filmTable.backgroundColor = .clear
        filmTable.separatorStyle = .none
        filmTable.layer.cornerRadius = 10
    }

    private func setupBehavior() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewFilmButtonDidTapped))
        filmTable.dataSource = self
        filmTable.delegate = self
        filmTable.register(MovieListTableCustomCell.self, forCellReuseIdentifier: .identifire)
    }

    // MARK: - Helpers
    @objc private func addNewFilmButtonDidTapped() {
        presenter.openNewFilmView()
    }
}

// MARK: - MainProtocol
extension MainViewController: MainViewProtocol {
    func reloadDataTable() {
        filmTable.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.filmGetting.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .identifire, for: indexPath) as? MovieListTableCustomCell else { return UITableViewCell() }
        cell.backgroundColor = .clear
        cell.configureCell(image: UIImage(data: presenter.filmGetting[indexPath.row].image),
                           name: presenter.filmGetting[indexPath.row].name,
                           rating: presenter.filmGetting[indexPath.row].ratings)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        212
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = presenter.filmGetting[indexPath.row]
        presenter.openDetailView(model: selectedCell)
    }
}
