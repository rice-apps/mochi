//
//  CardView.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import SwiftUI

struct CardView: View {
    let eventCard: EventCard
    
    @State private var isShowingDetail = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.white)

            VStack {
                Text(eventCard.date).font(.largeTitle).foregroundColor(.black)
                Text(eventCard.title).font(.largeTitle).foregroundColor(.black)
                // display the icons of people attending
                // Text(String(eventCard.participants) ).font(.largeTitle).foregroundColor(.black)
                Text(eventCard.groupStatus).font(.largeTitle).foregroundColor(.black)
                
                if isShowingDetail {
                    Text(eventCard.detail)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .onTapGesture {
            isShowingDetail.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(eventCard: EventCard.example)
        }
}
