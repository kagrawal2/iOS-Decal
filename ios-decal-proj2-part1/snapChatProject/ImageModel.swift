//
//  ImageModel.swift
//  snapChatProject
//
//  Created by Kireet Agrawal on 3/7/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePost {
    
    var photo: UIImage?
    var order: NSDate
    var seen: Bool
    var from: String?
    
    
    init(ord: NSDate, phot: UIImage?, see: Bool, fro: String?) {
        self.order = ord
        self.photo = phot
        self.seen = false
        self.from = fro
    }
}
