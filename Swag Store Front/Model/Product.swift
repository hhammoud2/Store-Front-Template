//
//  Product.swift
//  Swag Store Front
//
//  Created by Hammoud Hammoud on 12/1/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import Foundation

struct Product {
    private(set) var description: String
    private(set) var price: String
    private(set) var imageName: String
    
    init(description: String, price: String, imageName: String) {
        self.description = description
        self.price = price
        self.imageName = imageName
    }
}
