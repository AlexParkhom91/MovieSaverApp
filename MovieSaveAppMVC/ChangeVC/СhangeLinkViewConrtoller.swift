import UIKit

final class СhangeLinkViewConrtoller: UIViewController, UITextFieldDelegate {

    // MARK: Public
    weak var delegate: InfoFilmDelegate?

    // MARK: Private
    private let changeLabel = UILabel()
    private let linkTextField = UITextField()
    private let saveButton = UIButton()
    private let simpleView = UIView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        setupUI()
        linkTextField.delegate = self
    }

    // MARK: - Setups

    private func setupConstraints() {
        // changeLabel
        view.addSubview(changeLabel)
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        changeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        // linkTextField
        view.addSubview(linkTextField)
        linkTextField.translatesAutoresizingMaskIntoConstraints = false
        linkTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 192).isActive = true
        linkTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        linkTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        linkTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        // simpleView
        view.addSubview(simpleView)
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.bottomAnchor.constraint(equalTo: linkTextField.bottomAnchor).isActive = true
        simpleView.centerXAnchor.constraint(equalTo: linkTextField.centerXAnchor).isActive = true
        simpleView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        simpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
        simpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        // saveButton
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: simpleView.bottomAnchor, constant: 42).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }

    private func setupUI() {
        // changeLabel
        changeLabel.text = "Film YouTube Link"
        changeLabel.font = UIFont(name: "Manrope-Medium", size: 22)
        changeLabel.textAlignment = .center
        // nameTextField
        linkTextField.placeholder = "YouTube Link"
        linkTextField.font = UIFont(name: "Manrope-Regular", size: 17)
        // simpleView
        simpleView.backgroundColor = UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 1)
        // saveButton
        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
    }

    // MARK: - Actions
    @objc private func saveButtonClick() {
        // url -> String
        if let url = linkTextField.text {
            delegate?.filmYouTubeLinkDelegate(url)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Add url movie!")
            linkTextField.text = ""
        }
    }

    // MARK: - Helpers
    private func showAllert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension СhangeLinkViewConrtoller: UITextViewDelegate {
    func textFieldShouldReturn(_ simpleTextField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
