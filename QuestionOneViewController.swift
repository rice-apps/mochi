//
//  QuestionOneViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/5/22.
//

import UIKit

class QuestionOneViewController: UIViewController {

    @IBOutlet weak var questionOne: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.inputViewController?.modalPresentationStyle = .fullScreen

        // Do any additional setup after loading the view.
        questionOne.text = "What are your favorite music genres?"
        questionOne.frame = CGRect(x: 32, y: 120, width: 326, height: 72)
        //questionOne.backgroundColor = .white
        //questionOne.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        questionOne.font = UIFont(name: "Poppins-SemiBold", size: 24)
        questionOne.numberOfLines = 0
        questionOne.lineBreakMode = .byWordWrapping
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
