//
//  HorizontalCollectionReusableView.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 05/11/20.
//

import UIKit

class HorizontalCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var collectionView: UICollectionView!
    var secondData = [AddOnModelElement]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Initialization code
    }
    
}

extension HorizontalCollectionReusableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout    {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return secondData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as! HorizontalCollectionViewCell
        cell.bgView.layer.cornerRadius = cell.bgView.frame.height/2
        cell.bgView.backgroundColor = .random()
        cell.titleLabel.text = secondData[indexPath.row].title
        cell.subtitleLabel.text = secondData[indexPath.row].subtitle

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.height, height: self.collectionView.frame.height)
    }
    
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
