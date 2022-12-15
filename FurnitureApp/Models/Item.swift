//
//  Item.swift
//  FurnitureApp
//
//  Created by Zachary Farmer on 11/29/22.
//

import Foundation


struct Item: Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let image: String
    
    init(title: String = "", subtitle: String = "", image: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
