//
//  EventCard.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import Foundation
import UIKit

class EventCard : UIView{
    @IBInspectable let date: String
    let title: String
    let participants: Array<String>
    let groupStatus: String
    let detail: String
    
    init(date:String, title:String, participants:Array<String>, groupStatus:String, detail:String) {
        self.date = "Mar 25, 2022 12:00 PM"
        self.title = "Lunch at West Servery"
        self.participants = ["Freda", "Lorraine"]
        self.groupStatus = "Group pending..."
        self.detail = "Be part of RiceApps' first Mochi event!"
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let example = EventCard(date: "Mar 25, 2022 12:00 PM", title: "Lunch at West Servery", participants: ["Freda", "Lorraine"], groupStatus: "Group pending...", detail: "Be part of RiceApps' first Mochi event!")
    
}
