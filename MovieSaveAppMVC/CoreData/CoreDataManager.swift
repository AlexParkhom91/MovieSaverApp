import CoreData
import UIKit

final class CoreDataManager {
    static let instance = CoreDataManager()

    private init() {}

    func saveFilm(_ film: Film) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let manageContext = appDelegate.persistentContainer.viewContext

        if let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: manageContext) {
            let movie = NSManagedObject(entity: entity, insertInto: manageContext)
            movie.setValue(film.name, forKey: "name")
            movie.setValue(film.rating, forKey: "raiting")
            movie.setValue(film.link, forKey: "link")
            movie.setValue(film.date, forKey: "date")
            movie.setValue(film.image, forKey: "image")
            movie.setValue(film.description, forKey: "descriprt")

            do {
                try manageContext.save()
                print("Save request send.")
            } catch let error as NSError {
                print(error)
            }

        } else {
            print("Error")
        }
    }

    func get() -> [Film] {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }

        let manageContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieEntity")

        do {
            let objects = try manageContext.fetch(fetchRequest)

            var films = [Film]()

            for object in objects {
                let name = object.value(forKey: "name") as? String ?? ""
                let rating = object.value(forKey: "raiting") as? String ?? ""
                let description = object.value(forKey: "descriprt") as? String ?? ""
                let date = object.value(forKey: "date") as? String ?? ""
                /// add image
                let image = object.value(forKey: "image") as? Data ?? Data()
                /// url -> string in 62 srtoke
                let link = object.value(forKey: "link") as? String ?? ""
                let film = Film(name: name, rating: rating, date: date, link: link, image: image, description: description)
                films.append(film)
            }

            return films

        } catch let error as NSError {
            print(error)
        }

        return []
    }
}
