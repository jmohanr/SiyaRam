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
  
    @StateObject var viewModel =  UploadPostViewModel()
    @State var isPresentPhotoPicker: Bool = true
    @State var disbaleUpload = false
    @Binding var selectedIndex: Int
    @State private var showAdditionalView = false

    var body: some View {
        VStack(spacing: 20) {
            if showAdditionalView {
                Loader(count: $viewModel.itemsCount).isHidden(!showAdditionalView)
            }
            topView
            postView
            Spacer()
           
        }.padding(.horizontal)
            .onAppear(){
                isPresentPhotoPicker = true
                disbaleUpload  = false
            }
    }
}

extension UploadPostView {
    var topView: some View {
        HStack {
            Button {
                clearPostData()
                showAdditionalView = false
            } label: {
                Text("Cancel")
            }
            Spacer()
            Text("NewPost")
            Spacer()
            Button {
                guard viewModel.caption.count > 0 || viewModel.description.count > 0 else { return  }
                showAdditionalView = true
                Task {
                    try await viewModel.uplaodPost(user: currentUser)
                    clearPostData()
                }
            } label: {
                Text("Upload")
            }.disabled(disbaleUpload)
        }
    }
    
    var postView: some View {
        HStack {
            PhotosPicker(selection: $viewModel.photoItem) {
                VStack {
                    CircularImageView(imageUrl: viewModel.src)
                }
            }.padding(.vertical,10)
            
            VStack(spacing: 15) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        Color.gray.opacity(0.2)
                    )
                    .frame(height: 40)
                    .overlay {
                        TextField("Enter your caption...", text: $viewModel.caption,axis: .vertical)
                            .padding(.horizontal)
                    }
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        Color.gray.opacity(0.2)
                    )
                    .frame(height: 100)
                    .overlay {
                        TextField("Enter text ...", text: $viewModel.description,axis: .vertical)
                            .padding(.horizontal)
                    }
                
            }
            Spacer()
        }
    }
    
    func clearPostData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.showAdditionalView = false
            self.viewModel.clearPostModel()
            self.selectedIndex = 0
        })
       
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(currentUser: User(id: "", emailId: "", userName: " "), selectedIndex: .constant(0))
    }
}
