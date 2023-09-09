//
//  TableViewController.swift
//  MyPlaces
//
//  Created by Nikita Shestakov on 03.09.2023.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var places = Place()
 // new   var places: Results<Place>!
    //results - автообновляемый типо контейнера который возвращает запрашиваемые обьъекты

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 85
        navigationController?.title = "My places"
        
        // new places = realm.objects(Place.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       // new  return places.isEmpty ? 0 : places.count
//  //del      return places.count
//    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
//
//        var place = places[indexPath.row]
//
//        cell.nameLabel.text = place.name
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//        // new cell.imageOfView.image = UIImage(data: place.image!)
// // del
//        if place.image == nil {
//            cell.imageOfView.image = UIImage(named: place.restorantImage!)
//        } else {
//            cell.imageOfView.image = place.image
//        }
//        // do suda
//
//        cell.imageOfView.layer.cornerRadius = cell.imageOfView.frame.height / 2
//
//        return cell
//    }
    
    
    // IBAction для связки кнопки Cancel для закрытия VC
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        guard let newPlaceVS = segue.source as? TableViewControllerForAdd else { return }
        newPlaceVS.DataSending()
        
        //guard let placeForAdd = newPlaceVS.newPlaceForAdd else { return }
//        places.append(placeForAdd)
 
        tableView.reloadData()
    }


  
}
