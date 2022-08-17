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
    var body: some View {
        VStack {
            avatarProfile
            Spacer()
        }
        .navigationTitle("Cadastro")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        .toolbar {
            if isDone {
                
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

