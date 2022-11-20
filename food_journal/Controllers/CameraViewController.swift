//
//  CameraViewController.swift
//  food_journal
//
//  Created by Dawn Apple on 2022-11-14.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePicked: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Obtaining the Location of the Documents Directory
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

        // Create URL
        let url = documents.appendingPathComponent("image.png")

        // Convert to Data
//        if let data = image.pngData() {
//            do {
//                try data.write(to: url)
//            } catch {
//                print("Unable to Write Image Data to Disk")
//            }
//        }

    }
    @IBAction func openCameraButton(_ sender: Any) {
      cameraInit()
    }
    
    func cameraInit() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            //view controller that manage system interfaces for taking pictures,videos,choosing media in library
             let imagePicker = UIImagePickerController()
            //assign delegate, allow to get image out of picker object
             imagePicker.delegate = self
            //source type to be present by controller
             imagePicker.sourceType = .camera;
            //allows user to crop image before use photo
             imagePicker.allowsEditing = false
            //present the camera
            self.present(imagePicker, animated: true, completion: nil)
         }
    }
    
    @IBAction func openLibraryButton(_ sender: Any) {
      getPhotos()
    }
    
    func getPhotos() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
               imagePicker.delegate = self
               imagePicker.sourceType = .photoLibrary;
               imagePicker.allowsEditing = true
               self.present(imagePicker, animated: true, completion: nil)
           }
    }
}
