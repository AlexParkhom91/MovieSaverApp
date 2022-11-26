import UIKit

protocol AddFilmViewProtocol: AnyObject {
    func updateNameLabel(text: String)
    func updateLinkLabel(url: String)
    func updateRatingLabel(rating: String)
    func updateDateLabel(date: String)
    func showErrorAlert()
}

final class AddFilmViewController: UIViewController {
    // MARK: - Public
    var presenter: AddFilmPresenterProtocol!

    // MARK: - Private
    private let filmImageView = UIImageView()
    private let nameLabel = UILabel()
    private let nameChangeLabel = UILabel()
    private let changeNameButton = UIButton()
    private let ratingLabel = UILabel()
    private let ratingChangeLabel = UILabel()
    private let changeRatingButton = UIButton()
    private let releaseDateLabel = UILabel()
    private let releaseChangeDateLabel = UILabel()
    private let releaseDateButton = UIButton()
    private let youtubeLabel = UILabel()
    private let youtubeChangeLabel = UILabel()
    private let youtubeLinkButton = UIButton()
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let pickerImage = UIImagePickerController()
    private var imageFromLibrary: UIImage?

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
        [filmImageView, nameLabel, nameChangeLabel, ratingLabel, ratingChangeLabel, releaseDateLabel, releaseChangeDateLabel, youtubeLabel, youtubeChangeLabel, changeNameButton, changeRatingButton, releaseDateButton, youtubeLinkButton, descriptionLabel, descriptionTextView].forEach { view.addSubview($0) }
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        // FilmImage view
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        filmImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        filmImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        filmImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        filmImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        filmImageView.layer.cornerRadius = 75
        filmImageView.clipsToBounds = true

        // "NAME BLOCK"
        // namelabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 35).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        // changing name label "default - "
        nameChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameChangeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6).isActive = true
        nameChangeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        nameChangeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        nameChangeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        // change name button
        changeNameButton.translatesAutoresizingMaskIntoConstraints = false
        changeNameButton.topAnchor.constraint(equalTo: nameChangeLabel.bottomAnchor, constant: 6).isActive = true
        changeNameButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        changeNameButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        changeNameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true

        // "RELEASE BLOCK"
        // "release date"
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 89).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        releaseDateLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        // changing release date"- default"
        releaseChangeDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseChangeDateLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 6).isActive = true
        releaseChangeDateLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        releaseChangeDateLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        releaseChangeDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        // change release date button
        releaseDateButton.translatesAutoresizingMaskIntoConstraints = false
        releaseDateButton.topAnchor.constraint(equalTo: releaseChangeDateLabel.bottomAnchor, constant: 6).isActive = true
        releaseDateButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        releaseDateButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        releaseDateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true

        // "RATING BLOCK"
        // "your raiting"
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 35).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        // changing raiting"- default"
        ratingChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingChangeLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 6).isActive = true
        ratingChangeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        ratingChangeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        ratingChangeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        // raiting change button
        changeRatingButton.translatesAutoresizingMaskIntoConstraints = false
        changeRatingButton.topAnchor.constraint(equalTo: ratingChangeLabel.bottomAnchor, constant: 6).isActive = true
        changeRatingButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        changeRatingButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        changeRatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true

        // "YOUTUBE BLOCK"
        // "YouTube Link"
        youtubeLabel.translatesAutoresizingMaskIntoConstraints = false
        youtubeLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 89).isActive = true
        youtubeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        youtubeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        youtubeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        // change youTube link" - default"
        youtubeChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        youtubeChangeLabel.topAnchor.constraint(equalTo: youtubeLabel.bottomAnchor, constant: 6).isActive = true
        youtubeChangeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        youtubeChangeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        youtubeChangeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        // youTube link change button
        youtubeLinkButton.translatesAutoresizingMaskIntoConstraints = false
        youtubeLinkButton.topAnchor.constraint(equalTo: youtubeChangeLabel.bottomAnchor, constant: 6).isActive = true
        youtubeLinkButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        youtubeLinkButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        youtubeLinkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true

        // "DESCRIPTION BLOCK"
        // description label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 207).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        // description textView
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47).isActive = true
    }

    // MARK: - Configure UI
    private func configureUI() {
        view.backgroundColor = .white
        title = "Add New"
        navigationController?.navigationBar.prefersLargeTitles = true

        filmImageView.image = UIImage(named: "Image")
        let tap = UITapGestureRecognizer(target: self, action: #selector(filmImagePickerButtonAction))
        filmImageView.isUserInteractionEnabled = true
        filmImageView.addGestureRecognizer(tap)
        filmImageView.contentMode = .scaleAspectFill

        [changeNameButton, changeRatingButton, releaseDateButton, youtubeLinkButton].forEach { $0.setTitle("Change", for: .normal) }
        [changeNameButton, changeRatingButton, releaseDateButton, youtubeLinkButton].forEach { $0.setTitleColor(.systemBlue, for: .normal) }

        [nameLabel, nameChangeLabel, ratingLabel, ratingChangeLabel, releaseDateLabel, releaseChangeDateLabel, youtubeLabel, youtubeChangeLabel].forEach { $0.textAlignment = .center }
        [nameLabel, nameChangeLabel, ratingLabel, ratingChangeLabel, releaseDateLabel, releaseChangeDateLabel, youtubeLabel, youtubeChangeLabel].forEach { $0.font = UIFont(name: "Manrope-Light", size: 18) }
        [nameChangeLabel, ratingChangeLabel, releaseChangeDateLabel, youtubeChangeLabel].forEach { $0.text = "-" }

        nameLabel.text = "Name"
        ratingLabel.text = "Your Rating"
        releaseDateLabel.text = "Release Date"
        youtubeLabel.text = "YouTubeLink"

        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "Manrope-Light", size: 18)
        descriptionTextView.backgroundColor = .systemGray6
        descriptionTextView.text = ""
    }

    // MARK: - Setup Behavior
    private func setupBehavior() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonDidTapped))
        changeNameButton.addTarget(self, action: #selector(selectNameButtonDidTapped), for: .touchUpInside)
        changeRatingButton.addTarget(self, action: #selector(selectRatingButtonDidTapped), for: .touchUpInside)
        releaseDateButton.addTarget(self, action: #selector(selectReleaseDateButtonDidTapped), for: .touchUpInside)
        youtubeLinkButton.addTarget(self, action: #selector(selectYouTubeLinkButtonDidTapped), for: .touchUpInside)

        pickerImage.delegate = self
    }

    // MARK: - Helpers
    @objc private func saveButtonDidTapped() {
        presenter.saveFilm(name: nameChangeLabel.text ?? "",
                           releaseDate: releaseChangeDateLabel.text ?? "",
                           rating: ratingChangeLabel.text ?? "",
                           link: youtubeChangeLabel.text ?? "",
                           imageFromLibrary: filmImageView.image ?? UIImage(),
                           descriptionText: descriptionTextView.text ?? "")
        presenter.backToMainView()
    }

    @objc private func selectNameButtonDidTapped() {
        presenter.openNameView()
    }

    @objc private func selectRatingButtonDidTapped() {
        presenter.openRatingView()
    }

    @objc private func selectReleaseDateButtonDidTapped() {
        presenter.openReleaseDateView()
    }

    @objc private func selectYouTubeLinkButtonDidTapped() {
        presenter.openUrlLinkView()
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - NewFilmProtocol
extension AddFilmViewController: AddFilmViewProtocol {
    func updateNameLabel(text: String) {
        nameChangeLabel.text = text
    }

    func updateLinkLabel(url: String) {
        youtubeChangeLabel.text = url
    }

    func updateRatingLabel(rating: String) {
        ratingChangeLabel.text = rating
    }

    func updateDateLabel(date: String) {
        releaseChangeDateLabel.text = date
    }

    func showErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "Please fill in all the information", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension AddFilmViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.editedImage] as? UIImage {
            imageFromLibrary = image
            filmImageView.image = imageFromLibrary
        }
        picker.dismiss(animated: true)
    }

    @objc private func filmImagePickerButtonAction() {

        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have asses to camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have access to gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
