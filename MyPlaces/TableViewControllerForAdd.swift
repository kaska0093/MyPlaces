//
//  TableViewControllerForAdd.swift
//  MyPlaces
//
//  Created by Nikita Shestakov on 04.09.2023.
//

import UIKit
import PhotosUI

class TableViewControllerForAdd: UITableViewController {
    var PhotoWasChooseByUser = false
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeType: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeImage: UIImageView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // активация кнопки при заполнении текстового поля с именем заведения
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
// delete
        DispatchQueue.main.async {
            self.newPlaceForAdd.savePlaces()
        }

    }
    @IBAction func CanselAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    var newPlaceForAdd = Place()

    // MARK: TV delegate
    
    // скрытие клавиатуры при выборе любой ячейки кроме первой
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cameraPhoto = UIImage(named: "camera")
            let photoPhoto = UIImage(named: "photo")
            
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default ) {_ in
                self.choosePhotoSourse(soursee: .camera)
            }
            let photo = UIAlertAction(title: "Photo", style: .default) {_ in
                self.picker()
            }
            // настройка отображения позиций UIAlertController
            camera.setValue(cameraPhoto, forKey: "image")
            photo.setValue(photoPhoto, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(camera)
            alert.addAction(photo)
            alert.addAction(cancel)
            present(alert, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    // метод делегата PHPickerViewControllerDelegate
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        for item in results {
            item.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                if let image = image as? UIImage {

                    DispatchQueue.main.async {
                        self.placeImage.image = image
                        self.placeImage.contentMode = .scaleAspectFill
                        self.placeImage.clipsToBounds = true
                    }
                }
            }
        }
    }
    // MARK: Data Pass To TVC
    func DataSending () {
        var image: UIImage?
        if PhotoWasChooseByUser {
            image = placeImage.image
        } else {
            image = UIImage(named: "camera")
        }
 //       newPlaceForAdd = Place(restorantImage: nil, name: placeName.text!, location: placeLocation.text, type: placeType.text, image: image)
    }
}
// MARK: text FIeld Delegate
// скрытие клавиатуры по кнопке Done
extension TableViewControllerForAdd: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        if placeName.text?.isEmpty == true {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
}

// MARK: Working with photo from camera
extension TableViewControllerForAdd: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func choosePhotoSourse (soursee sourse: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self // требует UINavigationControllerDelegate
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            PhotoWasChooseByUser = true
            present(imagePicker, animated: true)
        }
    }
    
    // метод протокола IImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        dismiss(animated: true)
    }  
}

// MARK: working with PHPicker (photo from libruary)
extension TableViewControllerForAdd: PHPickerViewControllerDelegate {
    
    func picker() {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        var picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        PhotoWasChooseByUser = true
        present(picker, animated: true)
    }
    
    

 
}




