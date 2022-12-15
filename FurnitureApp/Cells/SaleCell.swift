//
//  PopularCell.swift
//  FurnitureApp
//
//  Created by Zachary Farmer on 12/4/22.
//

import UIKit

class SaleCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: SaleCell.self)
    static let nib = UINib(nibName: String(describing: SaleCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
