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
    @Published var itemsCount: Int = 0

    @Published var image: Image?
    @Published var src: String?
    @Published var uiImage: UIImage?
    @Published var caption: String = ""
    @Published var description: String = ""
    
    var imageUrl: String = ""
    
    @MainActor
    func loadImageData(from item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uImage = UIImage(data: data) else {return}
        self.image = Image(uiImage: uImage)
        guard let imgURl = try? await ImageUpload.uploadImage(uImage: uImage) else { return }
        imageUrl = imgURl
        self.src = imgURl
        self.uiImage = uImage
    }
    @MainActor
    func uplaodPost(user: User) async throws {
        guard let uId = Auth.auth().currentUser?.uid else { return  }
        let path = Firestore.firestore().collection(DBKeys.posts.rawValue).document()
        let post = Post(id: path.documentID, src: imageUrl, title: caption, srcType: self.srcType(imge: imageUrl), feedDescription: description,time: Timestamp(),ownerId: uId)
        guard let encodePost = try? Firestore.Encoder().encode(post) else { return }
        try await path.setData(encodePost)
        itemsCount = 1
    }
    
    func srcType(imge: String) -> SrcType {
        if imge.count > 1 {
            return .Image
        }
        return .Text
    }
    
    func clearPostModel() {
        self.photoItem = nil
        self.image = nil
        caption = ""
        description = ""
    }
}
