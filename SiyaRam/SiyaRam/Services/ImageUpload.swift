//
//  ImageUpload.swift
//  SiyaRam
//
//  Created by Kaplan2 on 25/06/23.
//

import UIKit
import SwiftUI
import Firebase
import FirebaseStorage

class ImageUpload {
    
    static func uploadImage(uImage: UIImage) async throws -> String? {
        guard let imgData = uImage.jpegData(compressionQuality: 0.8) else { return nil }
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        do {
            let value = try await ref.putDataAsync(imgData)
            print("DEBUG: \(value.name ?? "") successfully Uploaded ")
            return try await ref.downloadURL().absoluteString
        } catch {
            debugPrint("DEBUG: error while uploading image")
            return nil
        }
    }
    
}
