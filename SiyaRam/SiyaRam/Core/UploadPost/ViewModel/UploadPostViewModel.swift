//
//  UploadPostViewModel.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import Foundation
import SwiftUI
import PhotosUI

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
    
    func loadImageData(from item: PhotosPickerItem?) async {
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uImage = UIImage(data: data) else {return}
        self.image = Image(uiImage: uImage)
    }
    
    func clearPostModel() {
        self.photoItem = nil
        self.image = nil
    }
}
