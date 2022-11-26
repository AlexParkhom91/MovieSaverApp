
import UIKit

protocol LinkViewProtocol: AnyObject {}

final class LinkViewController: UIViewController {
    // MARK: - Public
    var presenter: LinkPresenterProtocol!

    // MARK: - Private
    private let changeLabel = UILabel()
    private let linkTextField = UITextField()
    private let simpleView = UIView()
    private let saveButton = UIButton()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI()
        setupBehavior()
    }

    // MARK: - Setup Subviews
    private func setupSubviews() {
        [changeLabel, linkTextField, simpleView, saveButton].forEach { view.addSubview($0) }
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        // changeLabel
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        // linkTextField
        linkTextField.translatesAutoresizingMaskIntoConstraints = false
        linkTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 192).isActive = true
        linkTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        linkTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        linkTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        // simpleView
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.bottomAnchor.constraint(equalTo: linkTextField.bottomAnchor).isActive = true
        simpleView.centerXAnchor.constraint(equalTo: linkTextField.centerXAnchor).isActive = true
        simpleView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        simpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        simpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        // saveButton
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: simpleView.bottomAnchor, constant: 42).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }

    // MARK: - Configure UI
    private func configureUI() {
        view.backgroundColor = .white
        // changeLabel
        changeLabel.text = "Film YouTube Link"
        changeLabel.font = UIFont(name: "Manrope-Medium", size: 22)
        changeLabel.textAlignment = .center
        // nameTextField
        linkTextField.placeholder = "YouTube Link"
        linkTextField.font = UIFont(name: "Manrope-Medium", size: 18)
        // simpleView
        simpleView.backgroundColor = UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1)
        // saveButton
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        saveButton.setTitleColor(.systemBlue, for: .normal)
    }

    // MARK: - Setup Behavior
    private func setupBehavior() {
        saveButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
    }

    // MARK: - Helpers
    @objc private func saveButtonDidTapped() {
        if linkTextField.text != "" {
            let url = linkTextField.text ?? ""
            presenter.backToNewFilmView()
            presenter.saveTextFromTF(text: linkTextField.text ?? "")
        } else {
            showAllert("Add url movie!")
            linkTextField.text = ""
        }
    }
}

// MARK: - UrlLinkProtocol
extension LinkViewController: LinkViewProtocol {
    private func showAllert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
