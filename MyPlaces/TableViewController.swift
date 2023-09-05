//
//  TableViewController.swift
//  MyPlaces
//
//  Created by Nikita Shestakov on 03.09.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var places = ModelOfPlace.generatePlaces()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 85
        navigationController?.title = "My places"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = places[indexPath.row].name
        cell.imageOfView.image = UIImage(named: places[indexPath.row].image)
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfView.layer.cornerRadius = cell.imageOfView.frame.height / 2

        return cell
    }
    
    // IBAction для связки кнопки Cancel для закрытия VC
    @IBAction func cancelAction (segue: UIStoryboardSegue) {
    }


  
}
