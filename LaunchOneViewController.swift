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
    @IBOutlet weak var brooklynButton: SelectionButton!
    @IBOutlet weak var breakingBadButton: SelectionButton!
    @IBOutlet weak var britishButton: SelectionButton!
    @IBOutlet weak var mirrorButton: SelectionButton!
    
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
    
    @IBOutlet weak var btnTwoLine: UIButton?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let firstAttributes: [NSAttributedString.Key: Any] = [ .font: UIFont(name: "Poppins-Medium", size: 20.0)!]

        let secondAttributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: "Poppins-MediumItalic", size: 12.0)!]
        
        let thirdAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1), .font: UIFont(name: "Poppins-Medium", size: 12.0)!]

        arcaneButton.titleLabel?.textAlignment = NSTextAlignment.center
        let firstString = NSMutableAttributedString(string: "Arcane\n", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "\nTwo sisters fight on rival sides of a war between magic technologies and clashing convictions.\n\n", attributes: secondAttributes)
        let thirdString = NSAttributedString(string: " You’re a true gamer, appreciate some great visuals, and love a touching romance plot.", attributes: thirdAttributes)

        firstString.append(secondString)
        firstString.append(thirdString)
        arcaneButton?.setAttributedTitle(firstString, for: [])

        brooklynButton.titleLabel?.textAlignment = NSTextAlignment.center
        let firstBrooklyn = NSMutableAttributedString(string: "Brooklyn Nine-Nine\n", attributes: firstAttributes)
        let secondBrooklyn = NSAttributedString(string: "\nA lovable team of NYPD detectives works together to solve crimes.\n\n", attributes: secondAttributes)
        let thirdBrooklyn = NSAttributedString(string: " You love to kick back and have a good laugh, and you don’t take things too seriously.", attributes: thirdAttributes)

        firstBrooklyn.append(secondBrooklyn)
        firstBrooklyn.append(thirdBrooklyn)
        brooklynButton?.setAttributedTitle(firstBrooklyn, for: [])
        
        breakingBadButton.titleLabel?.textAlignment = NSTextAlignment.center
        let firstBreaking = NSMutableAttributedString(string: "Breaking Bad\n", attributes: firstAttributes)
        let secondBreaking = NSAttributedString(string: "\n2 men sell meth in order to make ends meet.\n\n", attributes: secondAttributes)
        let thirdBreaking = NSAttributedString(string: " You’re a caring person who doesn’t show it all the time, and you insist you’re always right. ", attributes: thirdAttributes)

        firstBreaking.append(secondBreaking)
        firstBreaking.append(thirdBreaking)
        breakingBadButton?.setAttributedTitle(firstBreaking, for: [])
        
        britishButton.titleLabel?.textAlignment = NSTextAlignment.center
        let firstBaking = NSMutableAttributedString(string: "The Great British Baking Show\n", attributes: firstAttributes)
        let secondBaking = NSAttributedString(string: "\n12 amateur bakers compete to get the title of Greatest British Baker.\n\n", attributes: secondAttributes)
        let thirdBaking = NSAttributedString(string: " You’re wholesome, but competitive. And you’re an absolute foodie! ", attributes: thirdAttributes)

        firstBaking.append(secondBaking)
        firstBaking.append(thirdBaking)
        britishButton?.setAttributedTitle(firstBaking, for: [])
        
        mirrorButton.titleLabel?.textAlignment = NSTextAlignment.center
        let firstMirror = NSMutableAttributedString(string: "Black Mirror\n", attributes: firstAttributes)
        let secondMirror = NSAttributedString(string: "\nStand-alone episodes that reveal the more unsettling aspects of modern society.\n\n", attributes: secondAttributes)
        let thirdMirror = NSAttributedString(string: "You’re an introspective, skeptical person who likes exploring the darker side of technology.", attributes: thirdAttributes)

        firstMirror.append(secondMirror)
        firstMirror.append(thirdMirror)
        mirrorButton?.setAttributedTitle(firstMirror, for: [])
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
