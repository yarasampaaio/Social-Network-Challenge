//
//  AddPostView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct AddPostView: View {
    @State var txt: String = ""
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                
                imagePicker
                
                TextField("Insira seu texto...", text: $txt)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(
                        width: SizesComponents.widthFirst
                    )
                
                Spacer()
            }
            
        }
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        .navigationTitle("Adicionar Post")
        .toolbar {
            if txt == "" {
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
    
    var imagePicker: some View{
        VStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(
                    width: SizesComponents.widthSecond
                )
            
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    
                    Text("Escolher Foto")
                        .font(.headline)
                }
                .frame(
                    width: SizesComponents.widthScreen*0.6,
                    height: SizesComponents.heightScreen*0.05
                )
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePickerComponent(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        
    }
}




struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
