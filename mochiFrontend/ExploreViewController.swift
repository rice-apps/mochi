//
//  ExploreViewController.swift
//  mochiOnboarding
//
//  Created by Katharine Bonilla on 2/26/22.
//
import Cards
import UIKit

class ExploreViewController: UIViewController {
    var actionBtn = UIButton()
    
    private var card: CardHighlight = {
        //let card = CardHighlight(frame: .zero)
        let card = CardHighlight(frame: CGRect(x: 0, y: 0, width: 326, height: 202))
        //card.backgroundImage = UIImage(named: "blue")
        //card.icon = UIImage(named: "pink")
        card.title = "title"
        card.itemTitle = "item title"
        card.itemSubtitle = "item subtitle"
        card.buttonText = "Learn More"
        
        var actionButton = UIButton()
        actionButton.frame = CGRect(x: 0, y: 0, width: 154, height: 52)
        

        return card
    }()
    

    @IBOutlet weak var exploreTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationItem.hidesBackButton = true
        
        exploreTitle.text = "This Month"
        exploreTitle.frame = CGRect(x: 32, y: 70, width: 225, height: 36)
        exploreTitle.font = UIFont(name: "Poppins-SemiBold", size: 24)
        view.addSubview(card)

        
    }
    
    @objc  func buttonTapped(){
        UIView.animate(withDuration: 0.2, animations: {
            self.actionBtn.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.actionBtn.transform = CGAffineTransform.identity
            })
        }
        //delegate?.cardHighlightDidTapButton?(card: self, button: actionBtn)
    }


    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        card.frame = CGRect(x: 32, y: 128, width: 326, height: 202)
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
