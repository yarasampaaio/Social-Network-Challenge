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
    
    @State private var name: String = ""
    @State private var password: String = ""
    
    @State private var isSecured = true
    
    @State private var showRegister = false
    
    @State private var go = false
    
    var body: some View {
        
        if go{
            MyTabView()
        }else{
            VStack(spacing: 40){
                loginAndPass
                actionButtons
      
            }
            .sheet(isPresented: $showRegister){
                RegisterView()
            }
            .ignoresSafeArea()
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
        
        
    }
    
    var loginAndPass: some View{
        VStack {
            HStack(alignment: .center) {
                Text("Nome:")
                    .font(.callout)
                    .bold()
                TextField("Insira seu Nome...", text: $name)
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
                self.go.toggle()
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
                Button("Cadastre-se"){
                    self.showRegister.toggle()
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
