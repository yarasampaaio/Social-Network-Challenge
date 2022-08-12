//
//  EmailView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 11/08/22.
//

import SwiftUI
import Combine

struct EmailView: View {
    @State var email: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                Text("E-mail:")
                    .font(.callout)
                    .bold()
                
                EmailInputView(placeHolder: "Insira seu e-mail", txt: $email)
                    .onChange(of: email, perform: onEmailInputChanged)
            }.padding()
            
            Spacer()
        }
        
        .navigationTitle("E-mail")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        .toolbar {
            if email == ""{
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
    
    private func onEmailInputChanged(changedEmail: String) {
        print("-----> in onEmailInputChanged: \(changedEmail) ")
    }
}

struct EmailInputView: View {
    var placeHolder: String = ""
    @Binding var txt: String
    
    var body: some View {
        TextField(placeHolder, text: $txt)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.emailAddress)
            .onReceive(Just(txt)) { newValue in
                let validString = newValue.filter { "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-+$!~&=#[]@".contains($0) }
                if validString != newValue {
                    self.txt = validString
                }
            }
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
