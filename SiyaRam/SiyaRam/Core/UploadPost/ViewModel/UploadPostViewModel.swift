//
//  UploadPostViewModel.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var photoItem: PhotosPickerItem? {
        didSet {
            Task{
                await loadImageData(from:photoItem)
            }
        }
    }
    
    @Published var image: Image?
    @Published var src: String?
    @Published var uiImage: UIImage?

    func loadImageData(from item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uImage = UIImage(data: data) else {return}
        self.image = Image(uiImage: uImage)
        self.uiImage = uImage
    }
    @MainActor
    func uplaodPost(caption: String,user: User) async throws {
        guard let uId = Auth.auth().currentUser?.uid else { return  }
        guard let img = self.uiImage else { return }
        let path = Firestore.firestore().collection(DBKeys.posts.rawValue).document()
        guard let imgURl = try? await ImageUpload.uploadImage(uImage: img) else { return }
        
        let post = FeedData(id: path.documentID, src: imgURl, title: user.userName, srcType: .Image, feedDescription: caption,time: Timestamp(),ownerId: uId)
        guard let encodePost = try? Firestore.Encoder().encode(post) else { return }
        try await path.setData(encodePost)
    }
    
    func clearPostModel() {
        self.photoItem = nil
        self.image = nil
    }
}
