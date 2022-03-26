//
//  QuestionOneViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/5/22.
//

import UIKit


@IBDesignable class SelectionButton: UIButton {
    var answers: [String] = []
    
    // Allows developer to edit what colors are shown in each state
    @IBInspectable var borderColorSelected:UIColor = UIColor.black
    @IBInspectable var borderColorDeselected:UIColor = UIColor.black
    
    @IBInspectable var borderWidth:CGFloat = 3
    @IBInspectable var cornerRadius:CGFloat = 12
    
//    // The text that's shown in each state
//    @IBInspectable var selectedText:String = "Selected"
//    @IBInspectable var deselectedText:String = "Deselected"
    
    // The color of text shown in each state
    @IBInspectable var textColorDeselected:UIColor = UIColor.black
    @IBInspectable var textColorSelected:UIColor = UIColor.white
    
    // Sets the Active/Inactive State
    @IBInspectable var active:Bool = false
    
    // Custom Border to the UIButton
    private let border = CAShapeLayer()

    override func draw(_ rect: CGRect) {
        
        // Setup CAShape Layer (Dashed/Solid Border)
        border.lineWidth = borderWidth
        border.cornerCurve = .continuous
        border.frame = self.bounds
        border.fillColor = nil
        border.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(border)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        let buttonTitle = self.titleLabel?.text
        
        // Setup the Button Depending on What State it is in
        if active {
            setSelected()
            answers.append(buttonTitle!)
        } else {
            setDeselected()
            //delete selected button from the list
            if let index = answers.firstIndex(of: buttonTitle!) {
                answers.remove(at: index)
            }
        }
        
        // Respond to touch events by user
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    @objc func onPress() {
        print("Button Pressed")
        active = !active
        
        if active {
            setSelected()
        } else {
            setDeselected()
        }
    }
    
    // Set the selected properties
    func setSelected() {
        border.strokeColor = borderColorSelected.cgColor
        self.backgroundColor = .black
//        self.setTitle(selectedText, for: .normal)
        self.setTitleColor(textColorSelected, for: .normal)
        self.tintColor = .white
    }
    
    // Set the deselcted properties
    func setDeselected() {
        border.strokeColor = borderColorDeselected.cgColor
        //self.backgroundColor = .white
        self.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
//        self.setTitle(deselectedText, for: .normal)
        self.setTitleColor(textColorDeselected, for: .normal)
        self.tintColor = .black
    }

}











class myCustomButton: UIButton {
    @IBAction func buttonPressed(sender: UIButton) {
        print("custom Button Clicked")
        sender.backgroundColor = .black
   }
}



class QuestionOneViewController: UIViewController {

    @IBOutlet weak var questionOne: UILabel!
    @IBOutlet weak var continueOne: UIButton!
    
    @IBOutlet weak var pop: SelectionButton!
    
//    @IBAction func hipHopButtonClicked(_ sender: UIButton) {
//        print("tapped")
//        sender.backgroundColor = .black
//    }
    
//    private var popButton: myCustomButton = {
//        var button = myCustomButton(frame:CGRect(x: 60, y:250, width: 80, height: 40))
//        button.setTitle("pop", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderWidth = 2
//        button.layer.cornerRadius = 12
//        return button
//    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.inputViewController?.modalPresentationStyle = .fullScreen
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        // Do any additional setup after loading the view.
        questionOne.text = "What are your favorite music genres?"
        questionOne.frame = CGRect(x: 32, y: 120, width: 326, height: 72)
        //questionOne.font = UIFont(name: "Poppins-SemiBold", size: 24)
        questionOne.numberOfLines = 0
        questionOne.lineBreakMode = .byWordWrapping
        
        continueOne.frame = CGRect(x: 219, y: 628, width: 139, height: 52)
        continueOne.setTitleColor(.white, for: .normal)
        continueOne.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        continueOne.layer.cornerRadius = 5
        continueOne.tintColor = .white
        //continueOne.setTitle("Continue", for: .normal)
        
        pop.frame = CGRect(x: 32, y: 224, width: 60, height: 37)
        pop.setTitleColor(.black, for: .normal)
        //pop.layer.backgroundColor = UIColor(red: 0.486, green: 0.165, blue: 0.906, alpha: 1).cgColor
        //pop.layer.cornerRadius = 5
        //pop.tintColor = .white
        //pop.setTitle("Continue", for: .normal)
        
    }


}
