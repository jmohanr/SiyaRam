//
//  Loader.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import SwiftUI

struct Loader: View {
    @State var message: String = "Loading..."
    @Binding var count: Int
    var body: some View {
        ProgressView {
            Text(message)
        }.isHidden(isHide(),remove: !isHide())
    }
    
    func  isHide() -> Bool {
        if self.count > 0 {
            return true
        }
        return false
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader(count: .constant(0))
    }
}
