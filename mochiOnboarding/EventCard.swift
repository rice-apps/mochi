//
//  EventCard.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import Foundation
import UIKit

@IBDesignable
class EventCard : UIView{
    @IBInspectable var date: String = "Mar 25, 2022 12:00 PM" //let
    @IBInspectable var title: String = "RiceApps Work Break"
//    @IBInspectable var participants: Array<String> = ["Freda", "Lorraine"]
    @IBInspectable var groupStatus: String = "Group pending..."
    @IBInspectable var detail: String = "Be part of RiceApps' first Mochi event!"
    
    //when create new card from code
    required init(date:String, title:String, groupStatus:String, detail:String) {
        self.date = date
        self.title = title
        self.groupStatus = groupStatus
        self.detail = detail
        super.init(frame: CGRect.zero)
//        setup(date: "Mar 25, 2022 12:00 PM", title: "Lunch at West Servery", groupStatus: "Group pending...", detail: "Be part of RiceApps' first Mochi event!")
    }

    //when dragging new uiview into the storyboard and say it's a view
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setup(date:String, title:String, groupStatus:String, detail:String) {
//        self.date = date
//        self.title = title
//        self.groupStatus = groupStatus
//        self.detail = detail
//
//    }
    
    let example = EventCard(date: "Mar 25, 2022 12:00 PM", title: "Lunch at West Servery", groupStatus: "Group pending...", detail: "Be part of RiceApps' first Mochi event!")
    
//
    
}
