//
//  LoginView.swift
//  SiyaRam
//
//  Created by Kaplan on 24/06/23.
//

import SwiftUI
import UIKit
struct LoginView: View {
   
    @StateObject var loginViewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                textInputsView
                forgetView
                loginButtonView
                DividerView()
                Spacer()
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack(spacing: 10) {
                        Text("Don't have an account?").font(.subheadline)
                        Text("Sign Up").fontWeight(.semibold)
                    }
                }
            }
            /*
             With this we can set frame based on screen
             .aspectRatio(CGSize(width: UIScreen.screenWidth/2, height: UIScreen.screenHeight/2), contentMode: .fit)*/
            .padding(.horizontal)
            .padding(.top,50)
        }
    }
}

extension LoginView {
    var textInputsView: some View {
        VStack {
            TextField("Enter your email id", text: $loginViewModel.email)
                .modifier(TextFieldModifier())
            SecureField("Enter your Password", text: $loginViewModel.password)
                .modifier(TextFieldModifier())
        }
    }
    var forgetView: some View {
        NavigationLink {
            ResetPasswordView()
        } label: {
            Text("ForgetPassword?")
                .frame(maxWidth: .infinity,maxHeight: 40,alignment: .trailing)
        }
    }
    
    var loginButtonView: some View {
        Button {
            Task {
                try await loginViewModel.login()
            }
            
        } label: {
            Text("Log In").modifier(ButtonModifier())
                .opacity(loginViewModel.email.count > 0 && loginViewModel.password.count > 0 ? 1.0:0.5)
        }
        .disabled(loginViewModel.email.count > 0 && loginViewModel.password.count > 0 ? false:true)
    }
    
}

struct DividerView: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(maxWidth: UIScreen.screenWidth/2-40,maxHeight: 0.5)
            Text("OR")
            Rectangle()
                .frame(maxWidth: UIScreen.screenWidth/2-40,maxHeight: 0.5)
        }.foregroundColor(.gray)
            .padding(.top)
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


