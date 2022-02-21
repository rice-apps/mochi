//
//  LaunchOneViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/19/22.
//

import UIKit

class LaunchOneViewController: UIViewController {

    @IBOutlet weak var LaunchQOne: UILabel!
    
    @IBOutlet weak var launchFinish: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        LaunchQOne.text = "What do you like to do on a Friday night?"
        LaunchQOne.frame = CGRect(x: 32, y: 120, width: 326, height: 72)
        //LaunchQOne.font = UIFont(name: "Poppins-SemiBold", size: 24)
        LaunchQOne.numberOfLines = 0
        LaunchQOne.lineBreakMode = .byWordWrapping
        
        launchFinish.frame = CGRect(x: 219, y: 628, width: 139, height: 52)
        launchFinish.setTitleColor(.white, for: .normal)
        launchFinish.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        launchFinish.layer.cornerRadius = 5
        launchFinish.tintColor = .white
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
