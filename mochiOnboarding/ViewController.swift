//
//  ViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/5/22.
//

import UIKit

class ViewController: UIViewController {
//    @ScaledMetric var width: CGFloat = 60
//    @ScaledMetric var height: CGFloat = 40
    
//    var body: UIViewController {
//        continueButton.frame(width: UIScreen.main.bounds.width * 0.9)
//    }

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        labelOne.text = "You will be paired with a group based on your interests."
        labelOne.frame = CGRect(x: 32, y: UIScreen.main.bounds.height * 0.67, width: 326, height: 60)
        //477
        //labelOne.backgroundColor = .white
        //labelOne.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        //labelOne.font = UIFont(name: "Poppins-SemiBold", size: 20)
        labelOne.numberOfLines = 0
        labelOne.lineBreakMode = .byWordWrapping
        
        labelTwo.text = "Tell us a little bit about yourself!"
        labelTwo.frame = CGRect(x: 32, y: UIScreen.main.bounds.height * 0.77, width: 326, height: 27)
        //569
        labelTwo.font = UIFont(name: "Poppins-Medium", size: 18)
        
        continueButton.frame = CGRect(x: 219, y: UIScreen.main.bounds.height * 0.85, width: 139, height: 52)
        //628 is the origin y
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        continueButton.layer.cornerRadius = 5
        continueButton.tintColor = .white
        //continueButton.setTitle("Continue", for: .normal)
        
    }

    @IBAction func continueButton(_ sender: Any) {
    }
    
    @objc func didTapButton() {
        let vc = UIViewController()
        
    }
    

}

