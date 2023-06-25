//
//  Modifiers.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
  
    func body(content: Content) -> some View {
        content.padding()
            .frame(maxHeight: 45)
            .background { Color(.systemGray6) }
            .cornerRadius(10)
    }

}

struct ButtonModifier: ViewModifier {
 
    func body(content: Content) -> some View {
        content.foregroundColor(.white)
        .frame(maxWidth: .infinity,maxHeight: 44)
        .background {
            Color.black
        }
        .cornerRadius(10)
    }

}
