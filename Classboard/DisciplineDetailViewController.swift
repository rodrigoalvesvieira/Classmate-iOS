//
//  DisciplineDetailViewController.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/23/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit

class DisciplineDetailViewController: UIViewController, iCarouselDataSource, iCarouselDelegate
{
    var items: [Int] = []
    @IBOutlet var carousel : iCarousel!
    
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
            
            var lecturePicture = UIImage(named: "photo")
            
            let controlsFilter = CIFilter(name: "CIColorControls")
            
            controlsFilter.setValue(CIImage(image: lecturePicture), forKey: kCIInputImageKey)
            
            controlsFilter.setValue(1.2, forKey: kCIInputContrastKey)
            
            let displayImage = UIImage(CGImage: CIContext(options:nil).createCGImage(controlsFilter.outputImage, fromRect:controlsFilter.outputImage.extent()))!
            
            (view as UIImageView!).image = displayImage
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


