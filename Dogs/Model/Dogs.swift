//
//  Dogs.swift
//  Dogs
//
//  Created by Alvaro Salomoni on 06/02/2019.
//  Copyright © 2019 Alvaro Salomoni. All rights reserved.
//

import Foundation

class Dogs: CustomStringConvertible {

    var name:String
    var image:String
    var section:String
    var country:String
    var isLiked: Bool = false
    
    init(name:String, image:String, section:String, country:String) {
        self.name = name
        self.image = image
        self.section = section
        self.country = country
    }
    
    public var description: String{
        return "name: \(name) - imageURL: \(image) - section: \(section) - country: \(country)"
    }
    
    
}
