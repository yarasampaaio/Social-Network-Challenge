//
//  PasswordView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct PasswordView: View {
    @State var password: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                Text("Senha:")
                    .font(.callout)
                    .bold()
                TextField("Insira sua senha...", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            Spacer()
        }
        
        
        .navigationTitle("Senha")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        .toolbar {
            if password == ""{
                Text("Concluído")
                    .foregroundColor(.secondary)
            }else{
                Button(action:{
                    
                    dismiss()
                }){
                    Text("Concluído")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
