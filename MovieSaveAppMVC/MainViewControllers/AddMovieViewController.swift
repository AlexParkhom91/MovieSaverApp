import Foundation
import UIKit
protocol InfoFilmDelegate: AnyObject {
    func filmNameDelegate(_ name: String)
    func filmRaitingDelegate(_ rating: String)
    func filmDateDelegate(_ date: Date)
    func filmYouTubeLinkDelegate(_ url: String)
}

final class AddMovieViewController: UIViewController {

    weak var delegate: InfoFilmDelegate?
    // MARK: Private

    private let filmImageView = UIImageView()
    private var pickedImage = UIImage()
    private let nameLabel = UILabel()
    private var nameChangeLabel = UILabel()
    private let ratingLabel = UILabel()
    private let ratingChangeLabel = UILabel()
    private let youtubeLabel = UILabel()
    private let youtubeChangeLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let releaseChangeDateLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let changeNameButton = UIButton()
    private let changeRatingButton = UIButton()
    private let releaseDateButton = UIButton()
    private let youtubeLinkButton = UIButton()
    private let descriptionTextView = UITextView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addConstraints()
        addUI()
    }

    private func addConstraints() {
        addfilmImageViewConstraint()
        addLablesConctraints()
    }

    private func addUI() {
        addMovieImageViewUI()
        addChangeButtons()
        addDescriptionTextField()
        addNavigationControllerUI()
    }

    private func addfilmImageViewConstraint() {
        view.addSubview(filmImageView)
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        filmImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        filmImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        filmImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        filmImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        filmImageView.layer.cornerRadius = 75
        filmImageView.clipsToBounds = true
    }

    private func addLablesConctraints() {
        view.addSubview(nameLabel)
        view.addSubview(nameChangeLabel)
        view.addSubview(ratingLabel)
        view.addSubview(ratingChangeLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(releaseChangeDateLabel)
        view.addSubview(youtubeLabel)
        view.addSubview(youtubeChangeLabel)
        view.addSubview(descriptionLabel)

        // "name"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 35).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        nameLabel.text = "Name"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "Manrope-Medium", size: 18)

        // changing name"- default"
        nameChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        nameChangeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6).isActive = true
        nameChangeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        nameChangeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        nameChangeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        nameChangeLabel.text = "-"
        nameChangeLabel.textColor = .black
        nameChangeLabel.textAlignment = .center
        nameChangeLabel.font = UIFont(name: "Manrope-Bold", size: 18)

        // "release date"
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 89).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        releaseDateLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        releaseDateLabel.text = "Release date"
        releaseDateLabel.textColor = .black
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.font = UIFont(name: "Manrope-Medium", size: 18)

        // changing release date"- default"
        releaseChangeDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseChangeDateLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 6).isActive = true
        releaseChangeDateLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        releaseChangeDateLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        releaseChangeDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        releaseChangeDateLabel.text = "-"
        releaseChangeDateLabel.textColor = .black
        releaseChangeDateLabel.textAlignment = .center
        releaseChangeDateLabel.font = UIFont(name: "Manrope-Bold", size: 18)

        // "your raiting"
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 35).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        ratingLabel.text = "Your Raiting"
        ratingLabel.textColor = .black
        ratingLabel.textAlignment = .center
        ratingLabel.font = UIFont(name: "Manrope-Medium", size: 18)

        // changing raiting"- default"
        ratingChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingChangeLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 6).isActive = true
        ratingChangeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        ratingChangeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        ratingChangeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        ratingChangeLabel.text = "-"
        ratingChangeLabel.textColor = .black
        ratingChangeLabel.textAlignment = .center
        ratingChangeLabel.font = UIFont(name: "Manrope-Bold", size: 18)

        // "YouTube Link"
        youtubeLabel.translatesAutoresizingMaskIntoConstraints = false
        youtubeLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 89).isActive = true
        youtubeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        youtubeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        youtubeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        youtubeLabel.text = "YouTube Link"
        youtubeLabel.textColor = .black
        youtubeLabel.textAlignment = .center
        youtubeLabel.font = UIFont(name: "Manrope-Medium", size: 18)

        // change youTube link" - default"
        youtubeChangeLabel.translatesAutoresizingMaskIntoConstraints = false
        youtubeChangeLabel.topAnchor.constraint(equalTo: youtubeLabel.bottomAnchor, constant: 6).isActive = true
        youtubeChangeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        youtubeChangeLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        youtubeChangeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        youtubeChangeLabel.text = "-"
        youtubeChangeLabel.textColor = .black
        youtubeChangeLabel.textAlignment = .center
        youtubeChangeLabel.font = UIFont(name: "Manrope-Bold", size: 18)

        // description label
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 207).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        descriptionLabel.text = "Description"
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "Manrope-Medium", size: 18)
    }

    private func addMovieImageViewUI() {
        filmImageView.image = UIImage(named: "Image")
        let tap = UITapGestureRecognizer(target: self, action: #selector(filmImagePickerButtonAction))
        filmImageView.isUserInteractionEnabled = true
        filmImageView.addGestureRecognizer(tap)
        filmImageView.contentMode = .scaleAspectFill
    }

    private func addChangeButtons() {
        view.addSubview(changeNameButton)
        view.addSubview(changeRatingButton)
        view.addSubview(releaseDateButton)
        view.addSubview(youtubeLinkButton)

        // change name button
        changeNameButton.translatesAutoresizingMaskIntoConstraints = false
        changeNameButton.topAnchor.constraint(equalTo: nameChangeLabel.bottomAnchor, constant: 6).isActive = true
        changeNameButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        changeNameButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        changeNameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        changeNameButton.setTitle("Change", for: .normal)
        changeNameButton.backgroundColor = .white
        changeNameButton.setTitleColor(.systemBlue, for: .normal)
        changeNameButton.titleLabel?.font = UIFont(name: "Manrope-Light", size: 18)
        changeNameButton.addTarget(self, action: #selector(changeNameButtonDidTapped), for: .touchUpInside)

        // change release date button
        releaseDateButton.translatesAutoresizingMaskIntoConstraints = false
        releaseDateButton.topAnchor.constraint(equalTo: releaseChangeDateLabel.bottomAnchor, constant: 6).isActive = true
        releaseDateButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        releaseDateButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        releaseDateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        releaseDateButton.setTitle("Change", for: .normal)
        releaseDateButton.backgroundColor = .white
        releaseDateButton.setTitleColor(.systemBlue, for: .normal)
        releaseDateButton.titleLabel?.font = UIFont(name: "Manrope-Light", size: 18)
        releaseDateButton.addTarget(self, action: #selector(releaseDateButtonDidTapped), for: .touchUpInside)

        // raiting change button
        changeRatingButton.translatesAutoresizingMaskIntoConstraints = false
        changeRatingButton.topAnchor.constraint(equalTo: ratingChangeLabel.bottomAnchor, constant: 6).isActive = true
        changeRatingButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        changeRatingButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        changeRatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        changeRatingButton.setTitle("Change", for: .normal)
        changeRatingButton.backgroundColor = .white
        changeRatingButton.setTitleColor(.systemBlue, for: .normal)
        changeRatingButton.titleLabel?.font = UIFont(name: "Manrope-Light", size: 18)
        changeRatingButton.addTarget(self, action: #selector(changeRatingButtonDidTapped), for: .touchUpInside)

        // youTube link change button
        youtubeLinkButton.translatesAutoresizingMaskIntoConstraints = false
        youtubeLinkButton.topAnchor.constraint(equalTo: youtubeChangeLabel.bottomAnchor, constant: 6).isActive = true
        youtubeLinkButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        youtubeLinkButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        youtubeLinkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        youtubeLinkButton.setTitle("Change", for: .normal)
        youtubeLinkButton.backgroundColor = .white
        youtubeLinkButton.setTitleColor(.systemBlue, for: .normal)
        youtubeLinkButton.titleLabel?.font = UIFont(name: "Manrope-Light", size: 18)
        youtubeLinkButton.addTarget(self, action: #selector(youtubeLinkButtonDidTapped), for: .touchUpInside)
    }

    private func addDescriptionTextField() {
        view.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47).isActive = true
        descriptionTextView.textColor = .lightGray
        descriptionTextView.text = "Enter a movie description"
        descriptionTextView.font = UIFont(name: "Manrope-Light", size: 14)
        descriptionTextView.delegate = self
    }

    @objc func changeNameButtonDidTapped() {
        let nameViewController = СhangeNameViewConrtoller()
        nameViewController.delegate = self
        navigationController?.pushViewController(nameViewController, animated: true)
    }

    @objc func releaseDateButtonDidTapped() {
        let dateViewController = СhangeDatePickerViewConrtoller()
        dateViewController.delegate = self
        navigationController?.pushViewController(dateViewController, animated: true)
    }

    @objc func changeRatingButtonDidTapped() {
        let rateViewController = СhangeRatitingPickerViewConrtoller()
        rateViewController.delegate = self
        navigationController?.pushViewController(rateViewController, animated: true)
    }

    @objc func youtubeLinkButtonDidTapped() {
        let linkViewController = СhangeLinkViewConrtoller()
        linkViewController.delegate = self
        navigationController?.pushViewController(linkViewController, animated: true)
    }

    // MARK: - Helpers
}

// MARK: - Extensions Image Picker Conrtoller
extension AddMovieViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {

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

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.editedImage] as? UIImage {
            pickedImage = image
            filmImageView.image = pickedImage
        }
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickedImage = image
            filmImageView.image = pickedImage
        }
    }
}

// MARK: - Extension Description TextView Delegate
extension AddMovieViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text.isEmpty {
            descriptionTextView.text = "Enter a movie description"
            descriptionTextView.textColor = UIColor.lightGray
        }
    }

    private func addNavigationControllerUI() {
        title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonClick))
    }
}

extension AddMovieViewController: InfoFilmDelegate {
    func filmRaitingDelegate(_ rating: String) {
        ratingChangeLabel.text = rating
    }

    func filmDateDelegate(_ date: Date) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMMM-dd-yyyy"
        releaseChangeDateLabel.text = dateformatter.string(from: date)
        print(date)
    }

    func filmYouTubeLinkDelegate(_ url: String) {
        youtubeChangeLabel.text = url
    }

    func filmNameDelegate(_ name: String) {
        nameChangeLabel.text = name
        print(name)
    }

    @objc private func saveButtonClick() {
        print("ok")
        let film = Film(name: nameChangeLabel.text!,
                        rating: ratingChangeLabel.text!,
                        date: releaseChangeDateLabel.text!,
                        link: youtubeChangeLabel.text!,
                        image: pickedImage.pngData()!,
                        description: descriptionTextView.text!)
        CoreDataManager.instance.saveFilm(film)
        navigationController?.popViewController(animated: true)
    }
}
