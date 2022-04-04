//
//  RegisteredViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 3/19/22.
//

import UIKit

class RegisteredViewController: UIViewController {
    @IBOutlet weak var registeredLabel: UILabel!
    @IBOutlet weak var registeredSubtitle: UILabel!
    
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        var event = "RiceApps Work Break"
        registeredLabel.text = "You have successfully registered for " + "\(event)" + "!"
        registeredLabel.font = UIFont(name: "Poppins-SemiBold", size: 24)
        registeredLabel.numberOfLines = 0
        registeredLabel.lineBreakMode = .byWordWrapping
        
        let firstAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1), .font: UIFont(name: "Poppins-Medium", size: 12.0)!]
        let firstString = NSAttributedString(string: "\(event)", attributes: firstAttributes)
        
        //registeredLabel?.setAttributedTitle(firstString, for: [])
        
        registeredSubtitle.text = "You will receive an email once you have been paired with a group."
        registeredSubtitle.font = UIFont(name: "Poppins-Medium", size: 18)
        registeredSubtitle.numberOfLines = 0
        registeredSubtitle.lineBreakMode = .byWordWrapping
        
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        continueButton.layer.cornerRadius = 5
        continueButton.tintColor = .white
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
