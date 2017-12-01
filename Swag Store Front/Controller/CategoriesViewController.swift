//
//  CategoriesViewController.swift
//  Swag Store Front
//
//  Created by Hammoud Hammoud on 11/30/17.
//  Copyright © 2017 Hammoud Hammoud. All rights reserved.
//

import UIKit
import PinLayout

class CategoriesViewController: UIViewController {
    
    //MARK: - Properties
    let shopByCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOP BY CATEGORY"
        label.font = baseFont?.withSize(15)
        label.textColor = .darkGray
        label.textAlignment = .left
        
        return label
    }()
    let categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryCell.self, forCellReuseIdentifier: "category cell")
        tableView.rowHeight = 175
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        return tableView
    }()
    
    //MARK: - Lifecylce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CLOTHES FOR CODERS"
        self.view.backgroundColor = .white
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        addSubviews()
    }

    override func viewDidLayoutSubviews() {
        shopByCategoryLabel.pin.left().right().top().marginTop(15).marginHorizontal(10).height(40)
        categoryTableView.pin.left().right().top(to: shopByCategoryLabel.edge.bottom).bottom().marginTop(10)
    }
    
    //MARK: - Setup Functions
    
    func addSubviews() {
        self.view.addSubview(shopByCategoryLabel)
        self.view.addSubview(categoryTableView)
    }
    //MARK: - Button Functions
    
    //MARK: - Helper/Other Functions
    

}

//MARK: - Tableview Extension
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "category cell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.configureCell(category: category)
            return cell
        }
        else {
            return CategoryCell()
        }
    }
    
}

