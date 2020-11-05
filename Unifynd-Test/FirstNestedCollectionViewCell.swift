//
//  FirstNestedCollectionViewCell.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 05/11/20.
//

import UIKit

class FirstNestedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
}

protocol FirstNestedCellDelegate:class {
    func cellTapped(title: String, subtitle: String)
}
