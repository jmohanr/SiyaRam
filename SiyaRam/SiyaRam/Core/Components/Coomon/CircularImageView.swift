//
//  CircularImageView.swift
//  SiyaRam
//
//  Created by Kaplan2 on 25/06/23.
//

import SwiftUI
import Kingfisher

struct CircularImageView: View {
    var imageUrl: String?
    var body: some View {
        VStack {
            if let src = imageUrl {
                KFImage(URL(string: src))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 80,height: 80)
            } else {
                Image(systemName: "person")
                    .resizable()
                    .background {
                        Color.gray
                    }
                    .clipShape(Circle())
                    .frame(width: 80,height: 80)
            }
        }
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(imageUrl: "")
    }
}
