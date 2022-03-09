//
//  UpcomingViewController.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import UIKit

class UpcomingViewController: UIViewController {
    var eventCardView: UIView! // "@IBOutlet weak"before var?
    
    var eventCard1 = CardView(ec: EventCard.example)
//    CardView(eventCard: CardView.example)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
//        eventCardView.layoutSubviews()
//        var card1 = CardView_Previews()
        
        let eCard = EventCard(date: "Mar 25, 2022 12:00 PM", title: "Lunch at West Servery", participants: ["Freda", "Lorraine"], groupStatus: "Group pending...", detail: "Be part of RiceApps' first Mochi event!")
        
        let card1 = CardView(ec: eCard)
        view.addSubview(card1)

    }

}
