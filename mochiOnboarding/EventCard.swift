//
//  EventCard.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import Foundation

struct EventCard {
    let date: String
    let title: String
    let participants: Array<String>
    let groupStatus: String
    let detail: String

    static let example = EventCard(date: "Mar 25, 2022 12:00 PM", title: "Lunch at West Servery", participants: ["Freda", "Lorraine"], groupStatus: "Group pending...", detail: "Be part of RiceApps' first Mochi event!")
    
}
