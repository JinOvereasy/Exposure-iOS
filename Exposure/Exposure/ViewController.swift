//
//  ViewController.swift
//  Exposure
//
//  Created by James Kang on 7/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
//import SwiftyJSON
//import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var numOfSlider: UILabel!
    @IBOutlet weak var testImageView: UIImageView!
    
    var image_1: UIImage?
    var image_2: UIImage?
    var image_temp1: UIImage?
    var image_temp2: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testImageView.image = try! UIImage(data: Data(contentsOf: URL(string: "https://firebasestorage.googleapis.com/v0/b/makestagram-45567.appspot.com/o/images%2Fposts%2FeoAn4vW2JvUMe89dbV8vRgkn7lt2%2F2017-07-02T00:47:16Z.jpg?alt=media&token=dd1e2f4d-846b-46e9-8f6d-70245d7e4acf")!))
        var imageSize = (self.testImageView.image?.size)
        var tempSize = imageSize
        tempSize?.width = (tempSize?.width)! / 5
        tempSize?.height = (tempSize?.height)! / 5
        self.image_1 = self.testImageView.image?.af_imageScaled(to: tempSize!)

        testImageView.image = try! UIImage(data: Data(contentsOf: URL(string: "https://firebasestorage.googleapis.com/v0/b/makestagram-45567.appspot.com/o/images%2Fposts%2FjCRXkHD9p4YqtIdSGpEEA2wkLWL2%2F2017-07-02T00:47:43Z.jpg?alt=media&token=afc50129-3aca-4750-bb9a-47f586d1ceb4")!))
        imageSize = (self.testImageView.image?.size)
        tempSize = imageSize
        tempSize?.width = (tempSize?.width)! / 5
        tempSize?.height = (tempSize?.height)! / 5
        self.image_2 = self.testImageView.image?.af_imageScaled(to: tempSize!)
        
        let image_temp1 = modifyAlpha(image_1, in_alpha: 0.5)
        let image_temp2 = modifyAlpha(image_2, in_alpha: 0)
        self.testImageView.image = mergedImageWith(frontImage: image_temp1, backgroundImage: image_temp2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* first slider move */
    @IBAction func firstSliderMove(_ sender: UISlider) {
        image_temp1 = modifyAlpha(image_1, in_alpha: sender.value)
        makepicture()
    }

    
    /* second slider move */
    @IBAction func sliderMove(_ sender: UISlider) {
        image_temp2 = modifyAlpha(image_2, in_alpha: sender.value)
        makepicture()
    }
    
    /* make picture */
    func makepicture() {
        self.testImageView.image = mergedImageWith(frontImage: image_temp1, backgroundImage: image_temp2)
    }
    
    /* save image to lib */
    @IBAction func testSpeed(_ sender: Any) {
        let image = self.testImageView.image

        let imageData = UIImageJPEGRepresentation(image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
    }
    
    /* modify alpha for image */
    func modifyAlpha(_ in_image: UIImage?, in_alpha: CFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions((in_image?.size)!, false, (in_image?.scale)!)
        in_image?.draw(at: .zero, blendMode: .normal, alpha: CGFloat(in_alpha))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    /* Just add a image on other image */
    func mergedImageWith(frontImage:UIImage?, backgroundImage: UIImage?) -> UIImage{
        if (backgroundImage == nil) {
            return frontImage!
        }
        
        let size = testImageView.frame.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        backgroundImage?.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        frontImage?.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height).insetBy(dx: size.width * 0, dy: size.height * 0))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}
