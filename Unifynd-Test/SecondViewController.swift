//
//  SecondViewController.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 05/11/20.
//

import UIKit

class SecondViewController: UIViewController,SecondNestedCellDelegate {

    var delegate: SecondNestedCellDelegate?
    var secondData = [AddOnModelElement]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.secondData = readLocalFile(forName: "SecondData")!
        
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
    }
    
    func cellTapped(title: String, subtitle: String)   {
        print("Cell Tapped! \(title)")
        let story = UIStoryboard(name: "Main", bundle: nil)
        let VC1 = story.instantiateViewController(withIdentifier: "FinalViewController") as! FinalViewController
        VC1.titleString = title
        VC1.subtitleString = subtitle
        let navController = UINavigationController(rootViewController: VC1) // Creating a navigation controller with VC1 at the root of the navigation stack.
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.present(navController, animated:true, completion: nil)
    }
    
    private func readLocalFile(forName name: String) -> [AddOnModelElement]? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                do {
                    let decodedData = try JSONDecoder().decode([AddOnModelElement].self, from: jsonData)
                    print("===================================")
                    print(decodedData[0].title)
                    return decodedData
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

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout    {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCell", for: indexPath) as! SecondCell
        cell.bgView.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width / 2)-7.5, height: self.collectionView.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HorizontalCollectionReusableView", for: indexPath) as? HorizontalCollectionReusableView {
                headerView.secondData = self.secondData
                headerView.delegate = self
                return headerView
            }
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    
}
