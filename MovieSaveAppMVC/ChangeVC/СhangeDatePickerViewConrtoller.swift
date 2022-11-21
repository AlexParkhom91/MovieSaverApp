import Foundation
import UIKit

final class СhangeDatePickerViewConrtoller: UIViewController {
    // MARK: - Properties
    // MARK: Public
    weak var delegate: InfoFilmDelegate?

    // MARK: Private
    private let releaseDateLabel = UILabel()
    private let datePicker = UIDatePicker()
    private let saveButton = UIButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        setupUI()
    }

    // MARK: - API
    // MARK: - Setups
    private func setupConstraints() {
        // release label
        view.addSubview(releaseDateLabel)
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        releaseDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        releaseDateLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true

        // release date picker
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 32).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 194).isActive = true

        // save button
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 32).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }

    private func setupUI() {
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textColor = .black
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.font = UIFont(name: "Manrope-Medium", size: 22)
        //
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        //
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .white
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        saveButton.addTarget(self, action: #selector(saveButtonClick), for: .touchUpInside)
    }

    @objc private func saveButtonClick() {
        delegate?.filmDateDelegate(datePicker.date)
        navigationController?.popViewController(animated: true)
    }
    // MARK: - Helpers
}
