//
//  ContentView.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 3/20/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("hello").padding()
        CardView2(card: Card.example)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
