//
//  EditProfileViewModel.swift
//  SiyaRam
//
//  Created by Kaplan2 on 25/06/23.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var photoItem: PhotosPickerItem? {
        didSet {
            Task{
                await loadImageData(from:photoItem)
            }
        }
    }
    var data: [String:Any] = [:]
    @Published var image: Image?
    @Published var name: String = ""
    @Published var bioData: String = ""
    @Published var uiImage: UIImage?
    @Published var src: String?

    init(user: User) {
        self.user  = user
        self.name = user.userName
        if let bio = user.bioData {
            self.bioData = bio
        }
        if let src = user.src {
            self.src = src
        }
    }
    func loadImageData(from item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uImage = UIImage(data: data) else {return}
        self.uiImage = uImage
        let imageUrl = try? await ImageUpload.uploadImage(uImage: uImage)
        self.src = imageUrl
        self.data["src"] = imageUrl
        self.image = Image(uiImage: uImage)
    }
    
    func updateUserData() async throws {
        
        if !name.isEmpty && user?.userName != name {
            data["userName"] = name
            
        }
       
        if !bioData.isEmpty && user?.bioData != bioData {
            data["bioData"] = bioData
        }
        
        try await Firestore.firestore().collection(DBKeys.users.rawValue).document(user?.id ?? "").updateData(data)
        try await AuthService.shared.loadUser()
        
    }
    
    func clearInputs() {
        self.photoItem = nil
        self.image = nil
    }
}
