//
//  ViewController.swift
//  Exposure
//
//  Created by James Kang on 7/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import ImagePicker

class ViewController: UIViewController, ImagePickerDelegate {
    
    var window: UIWindow?

    @IBAction func ImagePicker(_ sender: Any) {
        
        let imagePickerController = ImagePickerController()
        imagePickerController.imageLimit = 2
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        // Show the navigation bar on other view controllers
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        //
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        //The images array contains the 2 images the user selected 
        showImageControllerWithImages(image1: images[0], image2: images[1])
    
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        //
    }
    
    func showImageControllerWithImages(image1: UIImage, image2: UIImage) {
        
        dismiss(animated: true) {

            
            //self.navigationController?.pushViewController(imageController, animated: true)
            
            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let imageController2 = storyBoard.instantiateViewController(withIdentifier: "ImageController") as! ImageController
            

//            imageController.testImageView.image = imageController.image1
            imageController2.image1 = image1
            imageController2.image2 = image2
            
            self.present(imageController2, animated: true, completion: nil)
            
            imageController2.image_temp1 = imageController2.modifyAlpha(imageController2.image1, in_alpha: 0.5)
            imageController2.image_temp2 = imageController2.modifyAlpha(imageController2.image2, in_alpha: 0.0)
            imageController2.testImageView.image = imageController2.image_temp1
        }

    }
}

