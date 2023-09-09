//
//  ModelOfPlace.swift
//  MyPlaces
//
//  Created by Nikita Shestakov on 04.09.2023.
//

import RealmSwift

class Place: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var image: Data?
    
//delete
    let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]

     func savePlaces() -> Void {
         for onePlace in restaurantNames {
             var image = UIImage(named: onePlace)
             guard let imageData = image?.pngData() else { return }
             var newplace = Place()

             newplace.image = imageData
             newplace.name = onePlace
             newplace.location = "Moscow"
             newplace.type = "Restaran"
             StorageManager.saveObject(newplace)
         }
    }
}
