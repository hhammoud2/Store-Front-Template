//
//  ProductsViewController.swift
//  Swag Store Front
//
//  Created by Hammoud Hammoud on 11/30/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    //MARK: - Properties

    private(set) public var products = [Product]()
    
    let productsLabel: UILabel = {
        let label = UILabel()
        label.text = "PRODUCTS"
        label.font = baseFont?.withSize(15)
        label.textColor = .darkGray
        label.textAlignment = .left

        return label
    }()
    
    let productsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 180, height: 260)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProductCell.self, forCellWithReuseIdentifier: "product cell")
        collection.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        
        return collection
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CLOTHES FOR CODERS"
        self.view.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
        productsCollection.delegate = self
        productsCollection.dataSource = self
        
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        productsLabel.pin.left().right().top().marginTop(15).marginHorizontal(10).height(30)
        productsCollection.pin.left().right().top(to: productsLabel.edge.bottom).bottom()
    }
    

    //MARK: - Setup Functions
    func addSubviews() {
        self.view.addSubview(productsLabel)
        self.view.addSubview(productsCollection)
    }
    
    //MARK: - Helper Functions
    func initProducts(category: Category) {
        products = DataService.instance.getProducts(categoryTitle: category.title)
        self.title = category.title
        
    }
}

//MARK: - Collection view extension
extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = productsCollection.dequeueReusableCell(withReuseIdentifier: "product cell", for: indexPath) as? ProductCell {
            let product = products[indexPath.row]
            cell.configureCell(description: product.description, price: product.price, imageName: product.imageName)
            return cell
        }
        else {
            return ProductCell(frame: .zero)
        }
    }
    
    
}
