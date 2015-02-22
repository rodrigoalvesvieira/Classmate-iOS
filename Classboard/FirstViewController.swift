//
//  FirstViewController.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/22/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit
import AVFoundation

enum Status: Int {
    case Preview, Still, Error
}

class FirstViewController: UIViewController, CameraDelegate {
    
    var camera: Camera?
    
    @IBOutlet weak var cameraStill: UIImageView!
    
    func initializeCamera() {
        self.camera = Camera(sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeCamera()
        
        println("eu existo")
        
        self.camera?.captureStillImage({ (image) -> Void in
            if image != nil {
                self.cameraStill.image = image;
                println("tirando foto")
            } else {
                println("ta nil")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Camera Delegate
    
    func cameraSessionConfigurationDidComplete() {
        self.camera?.startCamera()
    }
    
    func cameraSessionDidBegin() {
        UIView.animateWithDuration(0.225, animations: { () -> Void in
//            self.cameraStatus.alpha = 0.0
//            self.cameraPreview.alpha = 1.0
//            self.cameraCapture.alpha = 1.0
//            self.cameraCaptureShadow.alpha = 0.4;
        })
    }
    
    func cameraSessionDidStop() {
//        self.cameraStatus.text = "Camera Stopped"
        UIView.animateWithDuration(0.225, animations: { () -> Void in
//            self.cameraStatus.alpha = 1.0
//            self.cameraPreview.alpha = 0.0
        })
    }

}

