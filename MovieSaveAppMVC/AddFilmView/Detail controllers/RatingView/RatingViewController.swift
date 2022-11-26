import UIKit

protocol RatingViewProtocol: AnyObject {}

final class RatingViewController: UIViewController {
    // MARK: - Public
    var presenter: RatingPresenterProtocol!

    // MARK: - Private
    private let ratingLabel = UILabel()
    private let ratingPicker = UIPickerView()
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
        [ratingPicker, ratingLabel, saveButton].forEach { view.addSubview($0) }
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        // rating label
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 126).isActive = true
        ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        // ratingPicker
        ratingPicker.translatesAutoresizingMaskIntoConstraints = false
        ratingPicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 192).isActive = true
        ratingPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingPicker.heightAnchor.constraint(equalToConstant: 131).isActive = true
        ratingPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        ratingPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        // saveButton
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 345).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    // MARK: - Configure UI
    private func configureUI() {
        view.backgroundColor = .white

        ratingLabel.text = "Your Rating"
        ratingLabel.textAlignment = .center
        ratingLabel.font = UIFont(name: "Manrope-Light", size: 22)

        saveButton.setTitle("Save", for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        saveButton.setTitleColor(.systemBlue, for: .normal)
    }

    // MARK: - Setup Behavior
    private func setupBehavior() {
        saveButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
        ratingPicker.dataSource = self
        ratingPicker.delegate = self
    }

    // MARK: - Helpers
    @objc private func saveButtonDidTapped() {
        presenter.backToNewFilmView()
    }
}

// MARK: - Extensions View
extension RatingViewController: RatingViewProtocol {}

extension RatingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        presenter.pickerNumbers.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(format: "%.1f", presenter.pickerNumbers[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        presenter.selectedRatingCallback?(String(format: "%.1f", presenter.pickerNumbers[row]))
    }
}
