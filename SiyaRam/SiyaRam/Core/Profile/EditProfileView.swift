//
//  EditProfileView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedPhoto = true
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Text("Edit Profile")
                    .foregroundColor(.black)
                Spacer()
                Button("Done") {
                    dismiss()
                }
            }.foregroundColor(.blue)
            Divider()
        }.padding(.horizontal)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
