//
//  ThirdViewController.swift
//  Unifynd-Test
//
//  Created by Raghav Sethi on 05/11/20.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var numbers:[Int] = []

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var allNumsLabel: UILabel!
    @IBOutlet weak var secondLargestLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBAction func enterButton(_ sender: Any) {
        if textField.text != "" {
            let n = Int(textField.text ?? "0")!
            self.numbers.append(n)
            print(numbers)
            DispatchQueue.main.async {
                self.textField.text = ""
                self.view1.isHidden = false
                self.view2.isHidden = false
                var stringArray = self.numbers.map { String($0) }
               
                self.allNumsLabel.text = stringArray.joined(separator: "\n")
                if self.numbers.count > 1   {
                    let number = self.secondLargest(nums: self.numbers)
                    self.secondLargestLabel.text = "\(number)"
                }
            }
        }
    }
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI()  {
        self.view1.layer.cornerRadius = 10
        self.view2.layer.cornerRadius = 10
        self.view1.isHidden = true
        self.view2.isHidden = true
        self.enterButton.layer.cornerRadius = 10
        self.enterButton.layer.borderWidth = 1.5
        self.enterButton.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    func secondLargest(nums: [Int]) -> Int  {
        var largest = 0
        var secondLargest = 0
        
        for index in 0..<nums.count {
            let val = nums[index]
            
            if val > largest {
                secondLargest = largest
                largest = val
            }
            else if val > secondLargest, val != largest {
                secondLargest = val
            }
        }
        if secondLargest == 0   {
            print("Invalid")
        }
        
        return secondLargest
    }
    
}
