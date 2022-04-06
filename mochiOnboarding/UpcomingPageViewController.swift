//
//  UpcomingPageViewController.swift
//  mochiOnboardingOnboarding
//
//  Created by Freda Zhang on 4/5/22.
//

import UIKit

class UpcomingPageViewController: UIViewController {

    @IBOutlet weak var thisMonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        thisMonLabel.text = "This Month"
        thisMonLabel.frame = CGRect(x: 32, y: 70, width: 225, height: 36)
        thisMonLabel.font = UIFont(name: "Poppins-SemiBold", size: 24)
        
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
