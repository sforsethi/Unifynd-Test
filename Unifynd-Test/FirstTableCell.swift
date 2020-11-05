//
//  FirstTableCell.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 04/11/20.
//

import UIKit

class FirstTableCell: UITableViewCell {

    @IBOutlet weak var genreLabel: UILabel!
    let artists = ["Eminem", "MGK", "Joyner Lucas", "Hopsin", "J. Cole", "Kendrick Lamar"]
    //var firstData = AddOnModel()
    var data = [AddOnModelElement]()
    weak var delegate: FirstNestedCellDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        self.firstData = readLocalFile(forName: "Data")!
//
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//     }
    
    private func readLocalFile(forName name: String) -> AddOnModel? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                do {
                    let decodedData = try JSONDecoder().decode(AddOnModel.self, from: jsonData)
                    return decodedData
                    print("===================================")
                } catch {
                    print("decode error")
                }
            }
        } catch {
            print(error)
        }
        return nil
    }

}

extension FirstTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstNestedCollectionViewCell", for: indexPath) as! FirstNestedCollectionViewCell
        cell.titleLabel.text = data[indexPath.row].title
        cell.subtitleLabel.text = data[indexPath.row].subtitle
        

        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 117, height: 84)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if delegate != nil {
            delegate?.cellTapped(title: data[indexPath.row].title, subtitle: data[indexPath.row].subtitle)
            }
     }
    
}


