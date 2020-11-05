//
//  FirstViewController.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 04/11/20.
//

import UIKit

class FirstViewController: UIViewController, FirstNestedCellDelegate {

    var firstData = AddOnModel()
    var genre = ["Hip-Hop", "Pop", "R&B", "Rock & Roll"]
    var delegate:FirstNestedCellDelegate?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstData = readLocalFile(forName: "Data")!
        
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    }
    
    private func readLocalFile(forName name: String) -> AddOnModel? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                do {
                    let decodedData = try JSONDecoder().decode(AddOnModel.self, from: jsonData)
                    print("===================================")
                    print(decodedData[0][0].title)
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
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableCell", for: indexPath) as? FirstTableCell
        else {
            fatalError("Unable to create first tableview cell")
        }
        cell.data = firstData[indexPath.row]
        cell.genreLabel.text = self.genre[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.tableView.frame.height
        return height/4
    }
    
    
}
