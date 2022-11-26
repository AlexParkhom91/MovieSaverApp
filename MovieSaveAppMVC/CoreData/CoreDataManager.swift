import CoreData
import UIKit
protocol CoreDataManagerProtocol {
    func saveFilm(_ model: Film)
    func getFilm() -> [Film]
}

final class CoreDataManager: CoreDataManagerProtocol {
    func saveFilm(_ model: Film) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext

        if let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: managedContext) {
            let film = NSManagedObject(entity: entity, insertInto: managedContext)

            film.setValue(model.name, forKey: "name")
            film.setValue(model.ratings, forKey: "ratings")
            film.setValue(model.discription, forKey: "discription")
            film.setValue(model.date, forKey: "releaseDate")
            film.setValue(model.image, forKey: "imageFilm")
            film.setValue(model.link, forKey: "link")
            do {
                try managedContext.save()
                print("Save request send")
            } catch let error as NSError {
                print(error)
            }
        } else {
            print("ERROR")
        }
    }

    func getFilm() -> [Film] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieEntity")

        do {
            let objects = try managedContext.fetch(fetchRequest)
            var filmsArray = [Film]()
            for someFilm in objects {
                let releaseDate = someFilm.value(forKey: "releaseDate") as? String ?? ""
                let name = someFilm.value(forKey: "name") as? String ?? ""
                let ratings = someFilm.value(forKey: "ratings") as? String ?? ""
                let discription = someFilm.value(forKey: "discription") as? String ?? ""
                let image = someFilm.value(forKey: "imageFilm") as? Data ?? Data()
                let link = someFilm.value(forKey: "link") as? String ?? ""
                let currentFilm = Film(date: releaseDate, image: image, name: name, ratings: ratings, link: link, discription: discription)
                filmsArray.append(currentFilm)
            }
            return filmsArray
        } catch let error as NSError {
            print(error)
        }
        return []
    }
}
