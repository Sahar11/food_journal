//
//  CameraViewController.swift
//  food_journal
//
//  Created by Dawn Apple on 2022-11-14.
//

import UIKit


class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker : UIImagePickerController!

//    @IBOutlet weak var imagePicked: UIImageView!
 
    @IBOutlet weak var imagePicked: UIImageView!
    @IBAction func onSaveButton(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        
        //view controller that manage system interfaces for taking pictures,videos,choosing media in library
       imagePicker = UIImagePickerController()
        //assign delegate, allow to get image out of picker object
        imagePicker.delegate = self
        //source type to be present by controller
        imagePicker.sourceType = .camera;
        //allows user to crop image before use photo
        imagePicker.allowsEditing = true
        //present the camera
        self.present(imagePicker, animated: true, completion: nil)
       
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
 
        imagePicked.image =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage
       
    }
    
    @IBAction func onGalleryButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        }

        
        func openLibraryButton(_ sender: Any) {
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
    
    
    func saveImage(imageName: String){
       //create an instance of the FileManager
       let fileManager = FileManager.default
       //get the image path
       let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
       //get the image we took with camera
       let image = imagePicked.image!
       //get the PNG data for this image
        let data = image.pngData()
       //store it in the document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        print(imagePath)
    }
        
//       func saveImageInDocumentDirectory(image: UIImage, fileName: String) -> URL? {
//
//            let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!;
//            let fileURL = documentsUrl.appendingPathComponent(fileName)
//           if let imageData = image.pngData() {
//                try? imageData.write(to: fileURL, options: .atomic)
//                return fileURL
//            }
//
//            return nil
//        }
        
        func loadImageFromPath(path: String) -> UIImage? {
            
            let image = UIImage(contentsOfFile: path)
            
            if image == nil {
                
                print("missing image at: \(path)")
            }
            print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
            return image
            
        }
    }

