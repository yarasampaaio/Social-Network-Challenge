//
//  NameView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 11/08/22.
//

import SwiftUI

struct NameView: View {
    @State var name: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                Text("Nome:")
                    .font(.callout)
                    .bold()
                TextField("Insira seu Nome...", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            Spacer()
        }
        
        
        .navigationTitle("Nome")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        .toolbar {
            if name == ""{
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

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
