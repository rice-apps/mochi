//
//  CardView.swift
//  mochiOnboarding
//
//  Created by Freda Zhang on 2/26/22.
//

import SwiftUI

@IBDesignable class CardView : UIView {
    var eventCard: EventCard?
    
    @State private var isShowingDetail = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.white)

            VStack {
                Text(eventCard!.date).font(.largeTitle).foregroundColor(.black)
                Text(eventCard!.title).font(.largeTitle).foregroundColor(.black)
                // display the icons of people attending
                // Text(String(eventCard.participants) ).font(.largeTitle).foregroundColor(.black)
                Text(eventCard!.groupStatus).font(.largeTitle).foregroundColor(.black)
                
                if isShowingDetail {
                    Text(eventCard!.detail)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .onTapGesture { [self] in
            self.isShowingDetail.toggle()
        }
    }

    required init(ec:EventCard) {
        self.eventCard = ec
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder: NSCoder) {
//        self.eventCard = EventCard()
        super.init(coder: coder)
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some UIView {
//        CardView(eventCard: EventCard.example)
//        }
//}
