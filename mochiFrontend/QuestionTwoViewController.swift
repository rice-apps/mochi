//
//  QuestionTwoViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/19/22.
//

import UIKit

class QuestionTwoViewController: UIViewController {

    @IBOutlet weak var questionTwo: UILabel!
    
    
    @IBOutlet weak var continueTwo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        
        questionTwo.text = "What are your hobbies?"
        questionTwo.frame = CGRect(x: 32, y: 120, width: 326, height: 36)
        //questionTwo.font = UIFont(name: "Poppins-SemiBold", size: 24)
        questionTwo.numberOfLines = 0
        questionTwo.lineBreakMode = .byWordWrapping
    
        continueTwo.frame = CGRect(x: 219, y: 690, width: 139, height: 52)
        continueTwo.setTitleColor(.white, for: .normal)
        continueTwo.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        continueTwo.layer.cornerRadius = 5
        continueTwo.tintColor = .white
        //continueTwo.setTitle("Continue", for: .normal)
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
