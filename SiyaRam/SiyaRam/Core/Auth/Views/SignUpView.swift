//
//  SignUpView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI

struct SignUpView: View {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State var isError = false
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(spacing:10) {
                Text("Create user")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("You will use this email to sign in to your account \n Pasword must be min 8 letters")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
extension SignUpView {
    var loginButtonView: some View {
        Button {
            Task {
                do {
                    try await viewModel.createUser()
                } catch  {
                  isError = true
                }
                
            }
            
        } label: {
            Text("Next").modifier(ButtonModifier())
                .opacity(viewModel.email.count > 0 && viewModel.password.count>0 && viewModel.userName.count > 0  ? 1.0:0.5)
        }
        .disabled(viewModel.email.count > 0 && viewModel.password.count>0 && viewModel.userName.count > 0  ? false:true)
    }
    
    var textInputsView: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .modifier(TextFieldModifier())
                .fontWeight(isError ? .black:.thin)
            SecureField("Password...", text: $viewModel.password)
                .modifier(TextFieldModifier())
            TextField("User Name...", text: $viewModel.userName)
                .modifier(TextFieldModifier())
        }
    }
}
