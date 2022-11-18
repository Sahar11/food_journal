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

    }
    @IBAction func openCameraButton(_ sender: Any) {
      cameraInit()
    }
    
    func cameraInit() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
             let imagePicker = UIImagePickerController()
             imagePicker.delegate = self
             imagePicker.sourceType = .camera;
             imagePicker.allowsEditing = false
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
