//
//  UploadPostView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    var currentUser: User
    @State var caption = ""
    @StateObject var viewModel =  UploadPostViewModel()
    @State var isPresentPhotoPicker: Bool = true
    @State var disbaleUpload = false
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack(spacing: 20) {
            topView
            postView
            Spacer()
        }.padding(.horizontal)
            .onAppear(){
                isPresentPhotoPicker = true
                disbaleUpload  = false
            }
            .photosPicker(isPresented: $isPresentPhotoPicker, selection: $viewModel.photoItem)
    }
}

extension UploadPostView {
    var topView: some View {
        HStack {
            Button {
                clearPostData()
                     } label: {
                Text("Cancel")
            }
            Spacer()
            Text("NewPost")
            Spacer()
            Button {
                Task {
                    try await viewModel.uplaodPost(caption:caption,user: currentUser)
                    clearPostData()
                }
            } label: {
                Text("Upload")
            }.disabled(disbaleUpload)
        }
    }
    
    var postView: some View {
        HStack {
            if let image = viewModel.image {
                image.resizable()
                    .scaledToFill()
                    .frame(maxWidth: 100,maxHeight: 100)
                    .clipped()
                    .cornerRadius(10)
            }
            TextField("Enter your caption...", text: $caption,axis: .vertical)
                Spacer()
        }
    }
    
    func clearPostData() {
        caption = ""
        viewModel.clearPostModel()
        selectedIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(currentUser: User(id: "", emailId: "", userName: " "), selectedIndex: .constant(0))
    }
}
