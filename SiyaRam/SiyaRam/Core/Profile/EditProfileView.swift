//
//  EditProfileView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI
import PhotosUI
import Kingfisher

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedPhoto = true
    @StateObject var viewModel:EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
      
    }
    
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
                    Task{
                        try await viewModel.updateUserData()
                        dismiss()
                    }
                }
            }.foregroundColor(.blue)
            Divider()
            PhotosPicker(selection: $viewModel.photoItem) {
                VStack {
                    CircularImageView(imageUrl: viewModel.src)
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }.padding(.vertical,10)
            
            VStack (alignment:.leading){
                EditProfileRowView(title: "Name", placeHolder: "Enter your Name", text: $viewModel.name)
                EditProfileRowView(title: "Bio", placeHolder: "Enter your BioData", text: $viewModel.bioData)
            }
            
            Spacer()
        }.padding(.horizontal)
            
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User(id: "", emailId: "", userName: ""))
    }
}

struct EditProfileRowView: View {
    var title: String
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Text(title)
                VStack(alignment:.leading) {
                TextField(placeHolder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
