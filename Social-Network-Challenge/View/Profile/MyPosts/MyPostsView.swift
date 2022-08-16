//
//  MyPostsView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct MyPostsView: View {
    
    @State private var showingActionSheet: Bool = false
    
    private var actionSheetTitle: String = "Action Sheet Title"
    private var actionSheetMessage: String = ""
    
    
    var body: some View {
        VStack {
            PostsComponents.addPost()
            ScrollView(.vertical){
                Button(action: {
                    showingActionSheet = true
                }) {
                    post
                }
                .confirmationDialog(Text(actionSheetTitle),
                    isPresented: $showingActionSheet,
                    titleVisibility: .automatic,
                    actions: {
                        Button("Excluir", role: .destructive) { }
                        Button("Editar") { }
                        Button("Cancelar", role: .cancel) { }
                    },
                    message: {
                        actionSheetMessage == "" ? nil : Text(actionSheetMessage)
                    }
                )
            }
        }.navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
            .navigationTitle("Meus Posts")
    }
}
var post : some View{
    VStack{
        GroupBox(label: Text(""),
                 content: {
            
            Image("image")
                .resizable()
                .frame(width: SizesComponents.widthSecond)
            
            Text("\n \("texto aqui")").foregroundColor(.primary)        }
        ).frame(width: SizesComponents.widthFirst)
            .cornerRadius(10)
        
        Text("Editado em: \("xx horas")")
            .font(.callout)
            .foregroundColor(.primary)             .frame(
            width: SizesComponents.widthSecond,
            alignment: .leading
        )
        
    }
}

struct MyPostsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostsView()
    }
}
