//
//  LoginView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var systemScheme = UITraitCollection.current.userInterfaceStyle
    
    @State var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn{
            MyTabView()
        }else{
            VStack {
                
                signInWithAppleButton.frame(
                    width: UIScreen.main.bounds.width*0.6,
                    height: UIScreen.main.bounds.height*0.06
                )
            }
            .ignoresSafeArea()
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    @ViewBuilder
    var signInWithAppleButton: some View {
        if colorScheme == .dark {
            mySignInWithAppleButton
                .signInWithAppleButtonStyle(.white)
        } else {
            mySignInWithAppleButton
                .signInWithAppleButtonStyle(.black)
        }
    }
    
    var mySignInWithAppleButton: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let auth):
                    //print("Authorization successful. \(auth.credential.description)")
                    
                    guard let credentials = auth.credential as? ASAuthorizationAppleIDCredential, let identityToken = credentials.identityToken, let identityTokenString = String(data: identityToken, encoding: .utf8) else { return }
                    let body = ["appleIdentityToken": identityTokenString]
                    guard let jsonData = try? JSONEncoder().encode(body) else { return }
                    
                    print(jsonData)
                    
                    isLoggedIn.toggle()
                    
                case .failure(let error):
                    print("Authorization failed: " + error.localizedDescription)
                }
            }
        )
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


//guard let credentials = auth.credential as? ASAuthorizationAppleIDCredential, let identityToken = credentials.identityToken, let identityTokenString = String(data: identityToken, encoding: .utf8) else { return }
//let body = ["appleIdentityToken": identityTokenString]
//guard let jsonData = try? JSONEncoder().encode(body) else { return }
//
//print(jsonData)
