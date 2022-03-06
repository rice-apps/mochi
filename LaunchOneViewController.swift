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
    @IBOutlet weak var arcaneButton: SelectionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        LaunchQOne.text = "Which TV series best describes you?"
        LaunchQOne.frame = CGRect(x: 32, y: 120, width: 326, height: 60)
        LaunchQOne.numberOfLines = 0
        LaunchQOne.lineBreakMode = .byWordWrapping
        
        //launchFinish.frame = CGRect(x: 219, y: UIScreen.main.bounds.height * 0.85, width: 139, height: 52)
        launchFinish.setTitleColor(.white, for: .normal)
        launchFinish.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        launchFinish.layer.cornerRadius = 5
        launchFinish.tintColor = .white
        
        //arcaneButton.text = "Arcane"
        arcaneButton.frame = CGRect(x: 32, y: 196, width: 326, height: 139)
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
