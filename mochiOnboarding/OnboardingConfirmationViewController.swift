//
//  OnboardingConfirmationViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/19/22.
//

import UIKit

class OnboardingConfirmationViewController: UIViewController {
    @IBOutlet weak var confirmationLabel: UILabel!
    @IBOutlet weak var editLabel: UILabel!
    
    
    @IBOutlet weak var upcomingButton: UIButton!
    
    //var test = "You can edit your questionnaire responses anytime under the "
    //var Profile = "Profile"
    //var test2 = " tab."
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        confirmationLabel.text = "You have successfully completed the interests questionnaire!"
        confirmationLabel.frame = CGRect(x: 32, y: 393, width: 326, height: 90)
        //questionTwo.font = UIFont(name: "Poppins-SemiBold", size: 24)
        confirmationLabel.numberOfLines = 0
        confirmationLabel.lineBreakMode = .byWordWrapping
        editLabel.text = "You can edit your questionnaire responses anytime under the Profile tab."
        editLabel.frame = CGRect(x: 32, y: 515, width: 326, height: 81)
        //questionTwo.font = UIFont(name: "Poppins-SemiBold", size: 24)
        editLabel.numberOfLines = 0
        editLabel.lineBreakMode = .byWordWrapping
    
        upcomingButton.frame = CGRect(x: 117, y: 628, width: 240, height: 52)
        upcomingButton.setTitleColor(.white, for: .normal)
        upcomingButton.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        upcomingButton.layer.cornerRadius = 5
        upcomingButton.tintColor = .white
        //upcomingButton.setTitle("See Upcoming Events", for: .normal)

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
