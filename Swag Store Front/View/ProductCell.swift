//
//  ProductCell.swift
//  Swag Store Front
//
//  Created by Hammoud Hammoud on 11/30/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    //MARK: - Properties
    let productImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shirt01.png")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        return image
    }()
    
    let productDescription: UILabel = {
        let label = UILabel()
        label.text = "Product Description"
        label.textColor = .darkGray
        label.textAlignment = .left
        label.font = baseFont?.withSize(14)
        label.numberOfLines = 2
        
        return label
    }()
    
    let productPrice: UILabel = {
        let label = UILabel()
        label.text = "$999"
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = baseFont?.withSize(14)
        
        return label
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
        contentView.addSubview(productImageView)
        contentView.addSubview(productDescription)
        contentView.addSubview(productPrice)
        layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Functions
    override func layoutSubviews() {
        productImageView.pin.size(180).top().left().right().marginBottom(10)
        productDescription.pin.below(of: productImageView).left().right().height(50)
        productPrice.pin.below(of: productDescription).left().right().height(30)
    }
}
