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
        labelTwo.font = UIFont(name: "Poppins-Medium", size: 18)
        
        continueButton.frame = CGRect(x: 219, y: UIScreen.main.bounds.height * 0.85, width: 139, height: 52)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        continueButton.layer.cornerRadius = 5
        continueButton.tintColor = .white
        //continueButton.setTitle("Continue", for: .normal)
        
        
//        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let new = storyboard.instantiateViewController(withIdentifier: "ViewController")
//        let old = storyboard.instantiateViewController(withIdentifier: "UpcomingViewController")
        
//        let initialViewControllerNew = storyboard.instantiateViewController(withIdentifier: "Navigation2")
//        let initialViewControllerOld = storyboard.instantiateViewController(withIdentifier: "Navigation")
        
//
//        if launchedBefore  {
//            show(old, sender: self)
//            //self.window?.rootViewController = initialViewControllerOld
//            print("Not first launch.")
//            self.navigationController?.navigationItem.hidesBackButton = true
//
//        } else {
//            show(new, sender: self)
//            //self.window?.rootViewController = initialViewControllerNew
//            print("First launch, setting UserDefault.")
//            UserDefaults.standard.set(true, forKey: "launchedBefore")
//        }
    }
    
    //This class’s job is to make a key for newUser in the user defaults and set it’s value
//    class NewUserChecker{
//      //A static incatnse of NewUserChecker which will allow to use the functions of the Core class
//      static let shared = NewUserChecker()
//      //checks for the key value for isNewUser.
//      func isNewUser() -> Bool{
//        //When the key isNewUser is first initialized,the default value is false so we need to return the opposite; true- to say that the user is a newUser
//        return !UserDefaults.standard.bool(forKey: "isNewUser")
//      }
//      //The function set’s the key isNewUser to false
//      func setIsNotNewUser(){
//        UserDefaults.standard.set(true, forKey: "isNewUser")
//      }
//    }
//    
//    override func viewDidLayoutSubviews() {
//      super.viewDidLayoutSubviews()
//      //Checks if user is a new user
//      if NewUserChecker.shared.isNewUser(){
//        //show onboarding
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        //optional depending on preference of how the screen looks
//        vc.modalPresentationStyle = .fullScreen
//        //presents the onboarding ViewController
//        present(vc, animated: true)
//        //Call the function to set the value if the user is new
//        NewUserChecker.shared.setIsNotNewUser()
//      }
//    }
    

    @IBAction func continueButton(_ sender: Any) {
    }
    
    @objc func didTapButton() {
        let vc = UIViewController()
        
    }
    

}

