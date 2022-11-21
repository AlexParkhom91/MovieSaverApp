import UIKit
final class СhangeNameViewConrtoller: UIViewController {
    // MARK: - Properties
    // MARK: Public
    weak var delegate: InfoFilmDelegate?

    // MARK: Private

    private let filmNameLabel = UILabel()
    private let enterFilmNameTextField = UITextField()
    private let saveNameButton = UIButton()
    private let simpleView = UIView()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraints()
        addSetupUI()
    }

    private func addConstraints() {
        // Film name label
        view.addSubview(filmNameLabel)
        filmNameLabel.translatesAutoresizingMaskIntoConstraints = false
        filmNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        filmNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        filmNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        filmNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true

        // Enter film name
        view.addSubview(enterFilmNameTextField)
        enterFilmNameTextField.translatesAutoresizingMaskIntoConstraints = false
        enterFilmNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        enterFilmNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        enterFilmNameTextField.topAnchor.constraint(equalTo: filmNameLabel.bottomAnchor, constant: 42).isActive = true
        enterFilmNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        // simple view
        view.addSubview(simpleView)
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.bottomAnchor.constraint(equalTo: enterFilmNameTextField.bottomAnchor).isActive = true
        simpleView.centerXAnchor.constraint(equalTo: enterFilmNameTextField.centerXAnchor).isActive = true
        simpleView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        simpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        simpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        // Save name buttont
        view.addSubview(saveNameButton)
        saveNameButton.translatesAutoresizingMaskIntoConstraints = false
        saveNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveNameButton.topAnchor.constraint(equalTo: enterFilmNameTextField.bottomAnchor, constant: 32).isActive = true
        saveNameButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveNameButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }

    private func addSetupUI() {
        // film name lable text
        filmNameLabel.text = "Film Name"
        filmNameLabel.textColor = .black
        filmNameLabel.textAlignment = .center
        filmNameLabel.font = UIFont(name: "Manrope-Medium", size: 22)

        // enter film name
        enterFilmNameTextField.placeholder = "Name"

        // simple view
        simpleView.backgroundColor = UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1)

        // save name
        saveNameButton.setTitle("Save", for: .normal)
        saveNameButton.backgroundColor = .white
        saveNameButton.setTitleColor(.systemBlue, for: .normal)
        saveNameButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 22)
        saveNameButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
    }

    // MARK: - API

    @objc private func saveButtonDidTapped() {
        if enterFilmNameTextField.text != "" {
            let name = enterFilmNameTextField.text ?? ""
            delegate?.filmNameDelegate(name)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill film name!")
        }
    }

    // MARK: - Setups
    // MARK: - Helpers
    private func showAllert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
