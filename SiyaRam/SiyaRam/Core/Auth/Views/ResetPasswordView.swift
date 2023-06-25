//
//  ResetPasswordView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var emailText = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var registrationViewModel:RegistrationViewModel

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack(spacing:10) {
                Text("Reset Your Password")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("You will use this email to Reset Your Password")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            textInputsView
            loginButtonView
            Spacer()
            
        }.padding(.horizontal)
        
    }
}

extension ResetPasswordView {
    var loginButtonView: some View {
        Button { } label: {
            Text("Next").modifier(ButtonModifier())
                .opacity(registrationViewModel.email.count > 0  ? 1.0:0.5)
        }
        .disabled(emailText.count > 0  ? false:true)
    }
    
    var textInputsView: some View {
        VStack {
            TextField("Enter your email id", text: $registrationViewModel.email)
                .modifier(TextFieldModifier())
        }
    }
}
struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}


