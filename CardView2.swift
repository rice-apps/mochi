//
//  CardView.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 3/20/22.
//

import Foundation
import SwiftUI

struct CardView2: View {
    let card: Card
    
    @State private var isShowingDetail = false
    
    @ViewBuilder var singleCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)

            VStack {
                Text(card.date)
                    .font(.body)
                    .foregroundColor(.black)
//                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(card.title)
                    .font(.title)
                    .foregroundColor(.black)
                Text(card.groupStatus)
                    .font(.body)
                    .foregroundColor(.black)
                
                if isShowingDetail {
                    Text(card.detail)
                        .font(.body)
                        .foregroundColor(.gray)
                    }
                if(isShowingDetail) {
                    Button("Hide details") {
                        isShowingDetail.toggle()
                    }.foregroundColor(.purple)
                        .padding()
                        .background(.white)
                        .border(Color.purple, width: 3)
                        .cornerRadius(7)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                else {
                    Button("Show details") {
                        isShowingDetail.toggle()
                    }.foregroundColor(.purple)
                        .padding()
                        .background(.white)
                        .border(Color.purple, width: 3)
                        .cornerRadius(7)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 200)
        .onTapGesture {
            isShowingDetail.toggle()
        }
    }

    var body: some View {
        VStack {
                Text("This Month")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                singleCard
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView2(card: Card.example)
    }
}

class EventCardVHC: UIHostingController<CardView2> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: CardView2(card: Card.example))
    }
}
