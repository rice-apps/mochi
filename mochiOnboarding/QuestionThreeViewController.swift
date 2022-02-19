//
//  QuestionThreeViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/19/22.
//

import UIKit

class QuestionThreeViewController: UIViewController {

    @IBOutlet weak var questionThree: UILabel!
    
    
    @IBOutlet weak var finishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        questionThree.text = "What do you like to do on a Friday night?"
        questionThree.frame = CGRect(x: 32, y: 120, width: 326, height: 72)
        //questionTwo.font = UIFont(name: "Poppins-SemiBold", size: 24)
        questionThree.numberOfLines = 0
        questionThree.lineBreakMode = .byWordWrapping
        
        finishButton.frame = CGRect(x: 246, y: 527, width: 112, height: 52)
        finishButton.setTitleColor(.white, for: .normal)
        finishButton.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        finishButton.layer.cornerRadius = 5
        finishButton.tintColor = .white
        //finishButton.setTitle("Finish", for: .normal)
    
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
