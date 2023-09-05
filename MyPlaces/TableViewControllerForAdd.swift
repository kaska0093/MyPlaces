//
//  TableViewControllerForAdd.swift
//  MyPlaces
//
//  Created by Nikita Shestakov on 04.09.2023.
//

import UIKit

class TableViewControllerForAdd: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: TV delegate
    
    // скрытие клавиатыру при выборе любой ячейки кроме первой
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
}
// скрытие клавиатуры по кнопке Done
extension TableViewControllerForAdd: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

   
