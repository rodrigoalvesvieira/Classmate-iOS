//
//  DisciplineDetailViewController.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/23/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit
import AssetsLibrary

class DisciplineDetailViewController: UIViewController {
    var items: [Int] = []
    
    var hideTopBar = false
    
    var currentImage: UIImage!
    var currentPreviewImage: CIImage!
    
    @IBOutlet weak var savePhotoButton: UIBarButtonItem!
    
    @IBOutlet weak var classPicture: UIImageView!
    
    @IBOutlet weak var contrastSlider: UISlider!
    
    @IBOutlet weak var brightnessSlider: UISlider!
    
    @IBAction func savePhoto(sender: AnyObject) {
        let optionMenu = UIAlertController(title: nil, message: "Escolher opção", preferredStyle: .ActionSheet)
        
        let deleteAction = UIAlertAction(title: "Salvar", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            let imageToSave = self.currentPreviewImage
            
            let softwareContext = CIContext(options:[kCIContextUseSoftwareRenderer: true])
            let cgimg = softwareContext.createCGImage(imageToSave, fromRect:imageToSave.extent())

            let library = ALAssetsLibrary()
            library.writeImageToSavedPhotosAlbum(cgimg, metadata:imageToSave.properties(), completionBlock:nil)
        })
        
        let saveAction = UIAlertAction(title: "Desfazer", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    // Prepares the sliders values
    func initializeSliders() {
        self.contrastSlider.minimumValue = 0.4
        self.contrastSlider.maximumValue = 2.2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var singleTap = UITapGestureRecognizer(target: self, action: "tappedImage")
        
        singleTap.numberOfTapsRequired = 1
        self.classPicture.userInteractionEnabled = true
        self.classPicture.addGestureRecognizer(singleTap)
        
        let lecturePicture = UIImage(named: "photo")
        let controlsFilter = CIFilter(name: "CIColorControls")
  
        self.currentImage = lecturePicture
        
        initializeSliders()
        
        controlsFilter.setValue(CIImage(image: lecturePicture), forKey: kCIInputImageKey)
        
        controlsFilter.setValue(1.9, forKey: kCIInputContrastKey)
        
        let displayImage = UIImage(CGImage: CIContext(options:nil)
            .createCGImage(controlsFilter.outputImage, fromRect:controlsFilter.outputImage.extent()))!
        
        self.classPicture.image = displayImage
        
        self.tabBarController?.tabBar.hidden = true
    }
    
    @IBAction func changeContrast(sender: AnyObject) {
        let value = self.contrastSlider.value
        
        let lecturePicture = self.currentImage
        let controlsFilter = CIFilter(name: "CIColorControls")
        
        controlsFilter.setValue(CIImage(image: lecturePicture), forKey: kCIInputImageKey)
        
        controlsFilter.setValue(value, forKey: kCIInputContrastKey)
        
        let displayImage = UIImage(CGImage: CIContext(options:nil)
            .createCGImage(controlsFilter.outputImage, fromRect:controlsFilter.outputImage.extent()))!
        
        self.classPicture.image = displayImage
        self.currentPreviewImage = controlsFilter.outputImage
    }
    
    @IBAction func changeBrightness(sender: AnyObject) {
        let value = self.contrastSlider.value
        
        let lecturePicture = self.currentImage
        let controlsFilter = CIFilter(name: "CIColorControls")
        
        controlsFilter.setValue(CIImage(image: lecturePicture), forKey: kCIInputImageKey)
        controlsFilter.setValue(value, forKey: kCIInputBrightnessKey)
        
        let displayImage = UIImage(CGImage: CIContext(options:nil)
            .createCGImage(controlsFilter.outputImage, fromRect:controlsFilter.outputImage.extent()))!
        
        self.classPicture.image = displayImage
    }
    
    func tappedImage() {
        self.navigationController?.navigationBar.hidden = !self.hideTopBar
        self.hideTopBar = !self.hideTopBar
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return self.hideTopBar
    }
}


