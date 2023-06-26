//
//  NoDataView.swift
//  SiyaRam
//
//  Created by Kaplan2 on 26/06/23.
//

import SwiftUI

struct NoDataView: View {
    @State var message: String = "No Data Found..."
    @Binding var count: Int
    var body: some View {
        VStack {
            Text(message)
        }.isHidden(isHide(),remove: !isHide())
    }
    
    func  isHide() -> Bool {
        if self.count > 1 {
            return false
        }
        return true
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView(count: .constant(0))
    }
}
