//
//  ModelOfPlace.swift
//  MyPlaces
//
//  Created by Nikita Shestakov on 04.09.2023.
//

import Foundation

struct ModelOfPlace {
    var image: String
    var name: String
    var location: String
    var type: String
    
    static let restaurantNames = [
        "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
        "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
        "Speak Easy", "Morris Pub", "Вкусные истории",
        "Классик", "Love&Life", "Шок", "Бочка"
    ]
    
    static func generatePlaces() -> [ModelOfPlace] {
        var place = [ModelOfPlace]()
        for onePlace in restaurantNames {
            place.append(ModelOfPlace(image: onePlace, name: onePlace, location: "Sochi", type: "Bar"))
        }
        return place
    }
}
