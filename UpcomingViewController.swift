//
//  UpcomingViewController.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import UIKit
import Cards
import SwiftUI

class UpcomingViewController: UIViewController {

//    @IBOutlet weak var thisMonthLabel: UILabel!
//    weak var cardViewInstance: CardView2!
    
//    let card = CardHighlight(frame: CGRect(x: 5, y: 45, width: 326 , height: 239))

//    var eventCardView: UIView! // "@IBOutlet weak"before var?
    
//    var eventCard1 = CardView(ec: EventCard.example)
//    CardView(eventCard: CardView.example)
    
    let example = EventCard(date: "Mar 25, 2022 12:00 PM", title: "Lunch at West Servery", groupStatus: "Group pending...", detail: "Be part of RiceApps' first Mochi event!")
    
//    let example = EventCard(frame: CGRect(x: 5, y: 90, width: 326 , height: 239))
//    example.date = "Mar 25, 2022 12:00 PM"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        thisMonthLabel.text = "This Month"
//        thisMonthLabel.frame = CGRect(x: 32, y: UIScreen.main.bounds.height * 0.7, width: 326, height: 60)
//        card.title = "Mar 25, 2022 12:00 PM"
//        card.itemTitle = "RiceApps Work Break"
//        card.itemSubtitle = "Group pending..."
//        card.textColor = UIColor.black
//
//        card.hasParallax = true
            
//        let cardContentVC = storyboard!.instantiateViewController(withIdentifier: "CardContent")
//        card.shouldPresent(cardContentVC, from: self, fullscreen: false)
        
//        view.addSubview(card)
//        view.addSubview(example)
//        view.addSubview(Card.example)
//        let cardviewInstance = CardView2(card: Card.example)
//        show(UpcomingViewController, )
//        print(cardviewInstance)
        
//        let exampleCardView = CardView(ec: example)
//        view.addSubview(exampleCardView)
        
        let vc = UIHostingController(rootView: CardView2(card: Card.example))
        addChild(vc)
        vc.view.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width * 0.8, height: 250)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
//        view.addSubview(customCard)
//        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
//
//        eventCardView.layoutSubviews()
//        var card1 = CardView_Previews()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        card.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width * 0.8, height: 250)
        
        let vc = UIHostingController(rootView: CardView2(card: Card.example))
        self.addChild(vc)
        vc.didMove(toParent: self)
        
        vc.view.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width * 0.8, height: 250)
        self.view.addSubview(vc.view)
//        vc.didMove(toParent: self)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    vc.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                    vc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    vc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    vc.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                ])
        
    }

}