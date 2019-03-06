//
//  Dog.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 22/01/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import Foundation
import UIKit

class Dog {
    
    var name:String
    var image:UIImage = UIImage()
    var isLiked: Bool = false
    
    init(name:String, image:UIImage) {
        self.name = name
        self.image = image
    }
}
