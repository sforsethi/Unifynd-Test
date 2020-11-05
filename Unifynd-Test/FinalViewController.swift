//
//  FinalViewController.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 05/11/20.
//

import UIKit

class FinalViewController: UIViewController {
    
    var titleString = ""
    var subtitleString = ""

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI()  {
        self.titleLabel.text = self.titleString
        self.subtitleLabel.text = self.subtitleString
    }
}
