import UIKit

protocol DateReleaseViewProtocol: AnyObject {}

final class DateReleaseViewController: UIViewController {
    // MARK: - Public
    var presenter: DateReleasePresenterProtocol!

    // MARK: - Private
    private let datePicker = UIDatePicker()
    private let releaseDateLabel = UILabel()
    private let saveButton = UIButton()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        configureUI()
        setupBehavior()
    }

    // MARK: - Setups
    // MARK: - Setup Subviews
    private func setupSubviews() {
        [releaseDateLabel, datePicker, saveButton].forEach { view.addSubview($0) }
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {

        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        releaseDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        releaseDateLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true

        // release date picker
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 32).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 194).isActive = true

        // save button
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 32).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }

    // MARK: - Configure UI
    private func configureUI() {
        view.backgroundColor = .white

        releaseDateLabel.font = UIFont(name: "Manrope-Light", size: 22)
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.textColor = .black

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
    }

    // MARK: - Setup Behavior
    private func setupBehavior() {
        saveButton.addTarget(self, action: #selector(saveButtonDidTapped), for: .touchUpInside)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
    }

    @objc private func saveButtonDidTapped() {
        presenter.backToNewFilmView()
        presenter.selectedDateCallback?(datePicker.date)
    }
}

// MARK: - ReleaseDateProtocol
extension DateReleaseViewController: DateReleaseViewProtocol {}
