//
//  ImageController.swift
//  Exposure
//
//  Created by STH on 2017/7/7.
//  Copyright © 2017年 Make School. All rights reserved.
//

import UIKit

class ImageController: UIViewController {
    
    var image_temp1: UIImage?
    var image_temp2: UIImage?
    
    
    @IBOutlet weak var testImageView: UIImageView!
    
    var image1: UIImage? {
        didSet {
            image_temp1 = image1
        }
    }
    
    var image2: UIImage? {
        didSet {
            image_temp2 = image2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstSlider(_ sender: UISlider) {
        image_temp1 = modifyAlpha(image1, in_alpha: sender.value)
        makepicture()
    }
    
    @IBAction func secondSlider(_ sender: UISlider) {
        image_temp2 = modifyAlpha(image2, in_alpha: sender.value)
        makepicture()
    }
    
    @IBAction func saveImage(_ sender: Any) {
        let image = self.testImageView.image
        
        let imageData = UIImageJPEGRepresentation(image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
    }
    
    /* make picture */
    func makepicture() {
        self.testImageView.image = mergedImageWith(frontImage: image_temp1, backgroundImage: image_temp2)
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
