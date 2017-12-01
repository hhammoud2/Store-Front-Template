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

    let productsLabel: UILabel = {
        let label = UILabel()
        label.text = "PRODUCTS"
        label.font = baseFont?.withSize(15)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    
    let productsCollection: UICollectionView = {
        let collection = UICollectionView()
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 180, height: 260)
        
        collection.register(ProductCell.self, forCellWithReuseIdentifier: "product cell")
        collection.backgroundColor = #colorLiteral(red: 0.9625374675, green: 0.9625598788, blue: 0.9625478387, alpha: 1)
        collection.collectionViewLayout = layout
        return collection
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollection.delegate = self
        productsCollection.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        productsLabel.pin.left().right().top().marginTop(15).marginHorizontal(10).height(40)

    }
    

    //MARK: - Setup Functions
    
    //MARK: - Helper Functions
}

//MARK: - Collection view extension
extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = productsCollection.dequeueReusableCell(withReuseIdentifier: "product cell", for: indexPath) as? ProductCell {
            //Do some stuff
            return cell
        }
        else {
            return ProductCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
    }
    
    
}
