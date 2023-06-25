//
//  UploadPostView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
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
                caption = ""
                viewModel.clearPostModel()
                selectedIndex = 0
         
            } label: {
                Text("Cancel")
            }
            Spacer()
            Text("NewPost")
            Spacer()
            Button {} label: {
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
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(selectedIndex: .constant(0))
    }
}
