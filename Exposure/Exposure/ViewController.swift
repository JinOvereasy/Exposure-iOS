//
//  ViewController.swift
//  Exposure
//
//  Created by James Kang on 7/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
//import SwiftyJSON
import AlamofireImage
import AlamofireNetworkActivityIndicator
import Kingfisher
import MZCroppableView

class ViewController: UIViewController {

    @IBOutlet weak var numOfSlider: UILabel!
    @IBOutlet weak var testImageView: UIImageView!
    
    var image_1: UIImage?
    var image_2: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        testImageView.image = try! UIImage(data: Data(contentsOf: URL(string: "https://firebasestorage.googleapis.com/v0/b/makestagram-45567.appspot.com/o/images%2Fposts%2FeoAn4vW2JvUMe89dbV8vRgkn7lt2%2F2017-07-02T00:47:16Z.jpg?alt=media&token=dd1e2f4d-846b-46e9-8f6d-70245d7e4acf")!))
        self.image_1 = self.testImageView.image

        testImageView.image = try! UIImage(data: Data(contentsOf: URL(string: "https://firebasestorage.googleapis.com/v0/b/makestagram-45567.appspot.com/o/images%2Fposts%2FjCRXkHD9p4YqtIdSGpEEA2wkLWL2%2F2017-07-02T00:47:43Z.jpg?alt=media&token=afc50129-3aca-4750-bb9a-47f586d1ceb4")!))
        self.image_2 = self.testImageView.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMove(_ sender: UISlider) {
        numOfSlider.text = String(sender.value)
        
        if ( sender.value < 128 ) {
            self.testImageView.image = self.image_1
        } else {
            self.testImageView.image = self.image_2
        }
    }

}

