//
//  UpcomingViewController.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import UIKit

class UpcomingViewController: UIViewController {
    @IBOutlet weak var eventCardView: UIView!
    
    var eventCard1 = CardView(eventCard: EventCard.example)
//    = storyboard!.instantiateViewController(identifier: <#T##String#>, creator: <#T##((NSCoder) -> ViewController?)?##((NSCoder) -> ViewController?)?##(NSCoder) -> ViewController?#>)
//    CardView(eventCard: CardView.example)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        eventCardView.layoutSubviews()

        // Do any additional setup after loading the view.
//        thisMonth.text = "This Month"
//        thisMonth.frame = CGRect(x: 32, y: UIScreen.main.bounds.height * 0.7, width: 326, height: 60)
        
    }

}
