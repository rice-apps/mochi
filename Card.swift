//
//  Card.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 3/20/22.
//

import Foundation

struct Card: Codable {
    let date: String
    let title: String
    let groupStatus: String
    let detail: String
    

    static let example = Card(date: "Mar 25, 2022 12:00 PM", title:"RiceApps Work Break",  groupStatus: "Group pending...", detail: "Be a part of Mochi's first event!")
}
