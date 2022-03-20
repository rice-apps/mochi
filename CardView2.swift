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

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
                .shadow(radius: 10)

            VStack {
                Text(card.date)
                    .font(.body)
                    .foregroundColor(.black)
                Text(card.title)
                    .font(.title)
                    .foregroundColor(.black)
                Text(card.groupStatus)
                    .font(.body)
                    .foregroundColor(.black)
//                Button{
//                    Text("View Detail")
//                }
                if isShowingDetail {
                    Text(card.detail)
                        .font(.body)
                        .foregroundColor(.gray)
                    }
                
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 200)
        .onTapGesture {
            isShowingDetail.toggle()
        }
//        .animation(.spring(), value: offset)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView2(card: Card.example)
    }
}
