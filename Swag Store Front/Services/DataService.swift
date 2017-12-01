//
//  DataService.swift
//  Swag Store Front
//
//  Created by Hammoud Hammoud on 11/30/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    private let hats = [
        Product(description: "Devslopes Logo Graphic Beanie", price: "$18", imageName: "hat01.png"),
        Product(description: "Devslopes Logo Hat Black", price: "$22", imageName: "hat02.png"),
        Product(description: "Devslopes Logo Hat White", price: "$22", imageName: "hat03.png"),
        Product(description: "Devslopes Logo Snapback", price: "$20", imageName: "hat04.png")
    ]
    
    private let hoodies = [
        Product(description: "Devslopes Logo Hoodie Grey", price: "$32", imageName: "hoodie01.png"),
        Product(description: "Devslopes Logo Hoodie Red", price: "$32", imageName: "hoodie02.png"),
        Product(description: "Devslopes Hoodie Grey", price: "$32", imageName: "hoodie03.png"),
        Product(description: "Devslopes Hoodie Black", price: "$32", imageName: "hoodie04.png")
    ]
    
    private let shirts = [
        Product(description: "Devslopes Logo Shirt Black", price: "$18", imageName: "shirt01.png"),
        Product(description: "Devslopes Badge Shirt Light Grey", price: "$18", imageName: "shirt02.png"),
        Product(description: "Devslopes Logo Shirt Red", price: "$18", imageName: "shirt03.png"),
        Product(description: "Hustle Delegate Shirt Grey", price: "$18", imageName: "shirt04.png"),
        Product(description: "Kickflip Studios Black", price: "$18", imageName: "shirt05.png")
    ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProducts(categoryTitle: String) -> [Product] {
        switch categoryTitle {
        case "SHIRTS":
            return getShirts()
        case "HATS":
            return getHats()
        case "HOODIES":
            return getHoodies()
        case "DIGITAL":
            return getDigitalGoods()
        default:
            return getShirts()
        }
    }
    
    func getHats() -> [Product] {
        return hats
    }

    func getHoodies() -> [Product] {
        return hoodies
    }
    
    func getShirts() -> [Product] {
        return shirts
    }
    
    func getDigitalGoods() -> [Product] {
        return digitalGoods
    }
    
}
