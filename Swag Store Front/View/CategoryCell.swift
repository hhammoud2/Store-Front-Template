//
//  CategoryCell.swift
//  Swag Store Front
//
//  Created by Hammoud Hammoud on 11/30/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    //MARK: - Properties
    
    let backgroundImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "digital")
        image.clipsToBounds = true
        
        return image
    }()
    
    let cellTitle: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textColor = .white
        label.textAlignment = .center
        label.font = boldFont
        
        return label
    }()
    
    //MARK: - Initializers
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.backgroundColor = .white
        contentView.addSubview(backgroundImage)
        contentView.addSubview(cellTitle)
        layoutSubviews()
    }
    
    //MARK: - Helper functions

    func configureCell(category: Category) {
        backgroundImage.image = UIImage(named: category.imageName)
        cellTitle.text = category.title
    }
    
    override func layoutSubviews() {
        backgroundImage.pin.top().bottom().left().right().marginVertical(4)
        cellTitle.pin.left().right().vCenter().height(40)
    }
}
