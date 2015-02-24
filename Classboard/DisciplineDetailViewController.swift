//
//  DisciplineDetailViewController.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/23/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit
import AssetsLibrary

class DisciplineDetailViewController: UIViewController, iCarouselDataSource, iCarouselDelegate
{
    var items: [Int] = []
    var currentPreviewImage: CIImage!
    
    @IBOutlet var carousel : iCarousel!
    
    @IBOutlet weak var savePhotoButton: UIBarButtonItem!
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        for i in 0...12 {
            items.append(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.type = .CoverFlow2
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int {
        return items.count
    }
    
    func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, var reusingView view: UIView!) -> UIView! {
        var label: UILabel! = nil
        
        //create new view if no view is available for recycling
        if (view == nil) {
            view = UIImageView(frame:CGRectMake(0, 0, 200, 200))
            
            let lecturePicture = UIImage(named: "photo")
            let controlsFilter = CIFilter(name: "CIColorControls")
            
            controlsFilter.setValue(CIImage(image: lecturePicture), forKey: kCIInputImageKey)
            
            controlsFilter.setValue(1.9, forKey: kCIInputContrastKey)
            
            let displayImage = UIImage(CGImage: CIContext(options:nil)
                .createCGImage(controlsFilter.outputImage, fromRect:controlsFilter.outputImage.extent()))!
            
            (view as UIImageView!).image = displayImage
            
            self.currentPreviewImage = controlsFilter.outputImage
            
            view.contentMode = .Center
        }
        
        return view
    }
    
    func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        
        if (option == .Spacing) {
            return value * 1.1
        }

        return value
    }
    
}


