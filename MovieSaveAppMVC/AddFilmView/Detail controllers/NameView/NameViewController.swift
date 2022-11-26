import UIKit

protocol NameViewProtocol: AnyObject {}

final class NameViewController: UIViewController {
    // MARK: - Public
    var presenter: NamePresenterProtocol!

    // MARK: - Private
    private let filmNameLabel = UILabel()
    private let enterFilmNameTextField = UITextField()
    private let simpleView = UIView()
    private let saveNameButton = UIButton()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureUI()
        setupBehavior()
        setupConstraints()
    }

    // MARK: - Setups
    private func setupSubviews() {
        [filmNameLabel, enterFilmNameTextField, simpleView, saveNameButton].forEach { view.addSubview($0) }
    }

    private func setupConstraints() {

        filmNameLabel.translatesAutoresizingMaskIntoConstraints = false
        filmNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        filmNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        filmNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        filmNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true

        // Enter film name

        enterFilmNameTextField.translatesAutoresizingMaskIntoConstraints = false
        enterFilmNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        enterFilmNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        enterFilmNameTextField.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 42).isActive = true
        enterFilmNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        // simple view

        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.bottomAnchor.constraint(equalTo: enterFilmNameTextField.bottomAnchor).isActive = true
        simpleView.centerXAnchor.constraint(equalTo: enterFilmNameTextField.centerXAnchor).isActive = true
        simpleView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        simpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        simpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        // Save name buttont

        saveNameButton.translatesAutoresizingMaskIntoConstraints = false
        saveNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveNameButton.topAnchor.constraint(equalTo: enterFilmNameTextField.bottomAnchor, constant: 32).isActive = true
        saveNameButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveNameButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }

    private func configureUI() {
        view.backgroundColor = .white

        filmNameLabel.font = UIFont(name: "Manrope-Light", size: 22)
        filmNameLabel.text = "Film Name"
        filmNameLabel.textAlignment = .center

        enterFilmNameTextField.placeholder = "Name"
        simpleView.backgroundColor = UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1)

        saveNameButton.setTitle("Save", for: .normal)
        saveNameButton.setTitleColor(.systemBlue, for: .normal)
        saveNameButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
    }

    private func setupBehavior() {
        saveNameButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
    }

    // MARK: - Helpers
    @objc private func saveButtonDidTapped() {
        if enterFilmNameTextField.text != "" {
            let name = enterFilmNameTextField.text ?? ""
            presenter.saveTextFromTF(text: enterFilmNameTextField.text ?? "")
            presenter.backToNewFilmView()
        } else {
            showAllert("Fill film name!")
        }
    }
}

// MARK: - NewFilmProtocol
extension NameViewController: NameViewProtocol {

    private func showAllert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
