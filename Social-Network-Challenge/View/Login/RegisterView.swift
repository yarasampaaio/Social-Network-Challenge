//
//  RegisterView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 16/08/22.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage(named: "Perfil")!
    @State private var isDone = false
    @Environment (\.dismiss) var dismiss
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var isSecured = true
    
    var body: some View {
        VStack {
            avatarProfile
            loginEmailPass
        }
        .navigationTitle("Cadastro")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        .toolbar {
            if !email.isEmpty && !password.isEmpty && !name.isEmpty{
                
                Button (action:{
                    dismiss()
                }){
                    Text("Done")
                        .foregroundColor(.accentColor)
                    
                }
            } else {
                Text("Done")
                    .foregroundColor(.secondary)
            }
        }
        
    }
    
    var avatarProfile: some View{
        Button(action: {
            self.isShowPhotoLibrary.toggle()
        }){
            Image(uiImage: self.image)
                .resizable()
                .frame(
                    width: SizesComponents.widthScreen*0.6,
                    height: SizesComponents.widthScreen*0.6
                )
                .cornerRadius(1000)
        }.sheet(isPresented: $isShowPhotoLibrary) {
            ImagePickerComponent(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        
    }
    
    var loginEmailPass: some View {
        VStack {
            HStack(alignment: .center) {
                Text("E-mail:")
                    .font(.callout)
                    .bold()
                TextField("Insira seu e-mail...", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.frame(width: SizesComponents.widthFirst)
            
            HStack(alignment: .center) {
                Text("Nome:")
                    .font(.callout)
                    .bold()
                TextField("Insira seu nome...", text: $name)
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
            Button(action: {
                
                isDone = !email.isEmpty && !password.isEmpty && !name.isEmpty
                
                if isDone{
                    let creatUserService = CreatUserService()
                    Task {
                        let session = await creatUserService.createUser(name: name, email: email, password: password)
                        
                    }
                    dismiss()
                    
                }
            }) {
                
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 20))
                    
                    Text("Registrar").foregroundColor(.white).bold().font(.headline)
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
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

