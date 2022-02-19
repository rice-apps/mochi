//
//  LaunchConfirmViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/19/22.
//

import UIKit

class LaunchConfirmViewController: UIViewController {

    @IBOutlet weak var confirmLabel: UILabel!
    
    @IBOutlet weak var confirmButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        confirmLabel.text = "Yay! Let’s check out some events!"
        confirmLabel.frame = CGRect(x: 32, y: 540, width: 326, height: 60)
        //confirmLabel.font = UIFont(name: "Poppins-SemiBold", size: 24)
        confirmLabel.numberOfLines = 0
        confirmLabel.lineBreakMode = .byWordWrapping
        
        confirmButton.frame = CGRect(x: 105, y: 628, width: 240, height: 52)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        confirmButton.layer.cornerRadius = 5
        confirmButton.tintColor = .white
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
