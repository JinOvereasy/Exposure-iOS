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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        //
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        //The images array contains the 2 images the user selected 
        print("Done button was pressed")
    
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        //
    }
}

