//
//  Discipline.swift
//  Classboard
//
//  Created by Rodrigo Alves on 2/23/15.
//  Copyright (c) 2015 Sgt. Peppers. All rights reserved.
//

import UIKit

class Discipline: NSObject {
    let createdAt: NSDate
    var time: NSDate
    
    var title: String
    var pictures = []
    
    init(title: String, time: NSDate) {
        self.createdAt = NSDate()
        self.title = title
        self.time = time
    }
    
}
