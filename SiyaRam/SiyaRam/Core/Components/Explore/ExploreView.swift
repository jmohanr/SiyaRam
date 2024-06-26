//
//  ExploreView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI
import Kingfisher

struct ExploreView: View {
    @State var user: User
    var body: some View {
        HStack {
            if let src = user.src {
                KFImage(URL(string: src))
                    .foregroundColor(.gray)
                    .frame(maxWidth: 40,maxHeight: 40)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.gray)
                    .frame(maxWidth: 40,maxHeight: 40)
                    .clipShape(Circle())
            }
           
                
            VStack(alignment: .leading) {
                Text(user.userName).fontWeight(.medium)
                if let subHeading = user.bioData {
                    Text(subHeading).fontWeight(.light)
                        .font(.footnote)
                }
                
            }
            Spacer()
        }.padding(.horizontal)
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(user: User(id: UUID().uuidString, emailId: "Kalki", userName: "Kalki"))
    }
}
//SearchData(id: UUID().uuidString, heading: "Kalki", subHeading: "Born to hunt Kali", src: "kalki")
