//
//  CreateUserNameView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI

struct CreateUserNameView: View {
    @State var emailText = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(spacing:10) {
                Text("Create UserName")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Pick your user name for new account.\nYou can always change it")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            textInputsView
            loginButtonView
            Spacer()
            
        }.padding(.horizontal)
           
        
    }
}

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
    }
}

extension CreateUserNameView {
    var loginButtonView: some View {
        Button { } label: {
            Text("Go To Password Screen").modifier(ButtonModifier())
                .opacity(emailText.count > 0  ? 1.0:0.5)
        }
        .disabled(emailText.count > 0  ? false:true)
    }
    
    var textInputsView: some View {
        VStack {
            TextField("Enter your email id", text: $emailText)
                .modifier(TextFieldModifier())
        }
    }
}
