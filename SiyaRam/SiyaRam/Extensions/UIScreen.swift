//
//  UIScreen.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import UIKit
import SwiftUI

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
