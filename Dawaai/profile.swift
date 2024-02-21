//
//  profile.swift
//  Dawaai
//
//  Created by user1 on 18/01/24.
//
import UIKit
class Profile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let simage = info[.originalImage] as? UIImage {
            imageView.image = simage
        }
    }
    @IBAction func cameraButtonTapped(_ sender: UIButton){
        let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                
                    let alertController = UIAlertController(title:
                       "Choose Image Source", message: nil,
                       preferredStyle: .actionSheet)
                
                    let cancelAction = UIAlertAction(title: "Cancel",
                       style: .cancel, handler: nil)
                    alertController.addAction(cancelAction)
                
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        let cameraAction = UIAlertAction(title: "Camera",
                           style: .default, handler: { action in
                            imagePicker.sourceType = .camera
                            self.present(imagePicker, animated: true, completion: nil)
                        })
                        alertController.addAction(cameraAction)
                    }
                
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                        let photoLibraryAction = UIAlertAction(title: "Photo Library",
                           style: .default, handler: { action in
                            imagePicker.sourceType = .photoLibrary
                            self.present(imagePicker, animated: true, completion: nil)
                        })
                        alertController.addAction(photoLibraryAction)
                    }
                
                    alertController.popoverPresentationController?.sourceView = sender
                
                    present(alertController, animated: true, completion: nil)
    }
}

