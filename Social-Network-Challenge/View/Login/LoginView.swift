//
//  LoginView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @State private var isLoggedIn = false
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isSecured = true
    
    
    @State private var go = false
    
    var body: some View {
        
        if go{
            MyTabView()
        }else{
            NavigationView {
                VStack(spacing: 40){
                    Image("Logo").resizable().frame(
                        width: SizesComponents.widthSecond,
                        height: SizesComponents.widthSecond
                    )
                    loginAndPass
                    actionButtons
                    
                }
                .ignoresSafeArea()
                
            }
        }
        
    }
    
    var loginAndPass: some View{
        VStack {
            HStack(alignment: .center) {
                Text("E-mail:")
                    .font(.callout)
                    .bold()
                TextField("Insira seu e-mail...", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.frame(width: SizesComponents.widthFirst)
            
            HStack(alignment: .center) {
                Text("Senha:")
                    .font(.callout)
                    .bold()
                
                if isSecured{
                    SecureField("Insira sua senha...", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }else{
                    TextField("Insira sua senha...", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .foregroundColor(.accentColor)
                }
                
            }.frame(width: SizesComponents.widthFirst)
        }
        
    }
    
    var actionButtons: some View{
        VStack {
            
            Button(action: {
                let loginService = LoginService()
                Task {
                    guard let session = await loginService.login(username: email, password: password) else {return}
                    print(session.token)
                }
                self.go = !email.isEmpty && !password.isEmpty
            }) {
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 20))
                    
                    Text("Entrar").foregroundColor(.white).bold().font(.headline)
                }
                .frame(
                    width: SizesComponents.widthSecond,
                    height: SizesComponents.heightScreen*0.06
                )
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            
            
            
            HStack{
                Text("ou")
                NavigationLink {
                    RegisterView()
                }label:{
                    Text("cadastre-se").foregroundColor(.accentColor)
                    
                }
            }.frame(
                width: SizesComponents.widthSecond,
                alignment: .trailing
            )
            
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
