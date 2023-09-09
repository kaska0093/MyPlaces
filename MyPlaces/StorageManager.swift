//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Nikita Shestakov on 07.09.2023.
//

import RealmSwift

var realm = try! Realm()

//delete all nize

class StorageManager {
    static func saveObject (_ place: Place) {
        print("rrrrrerfsgsgsergdsfgdfgsdfg")
        print(Realm.Configuration.defaultConfiguration.fileURL)
        try! realm.write {
            realm.add(place)
        }
    }
}
