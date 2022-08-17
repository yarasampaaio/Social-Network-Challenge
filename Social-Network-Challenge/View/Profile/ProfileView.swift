//
//  ProfileView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 11/08/22.
//

import SwiftUI

struct ProfileView: View{
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage(named: "Perfil")!

    var body: some View{
        NavigationView {
            VStack(spacing: 20){
                    
                    avatarProfile
                    
                    List {
                        
                        ItemNavigationListComponent.buildItem(ItensProfile.myPosts)
                        ItemNavigationListComponent.buildItem(ItensProfile.myFriends)
                        
                        Section(header: Text("Meus Dados"),
                                content: {
                            
                            ItemNavigationListComponent.buildItem( ItensProfile.name)
                            
                            ItemNavigationListComponent.buildItem( ItensProfile.email)
                            
                            ItemNavigationListComponent.buildItem(ItensProfile.password)
                        
                        }
                                
                        )
                        
                    }.listStyle(.insetGrouped)
            }.navigationTitle("Perfil")
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

private struct ItensProfile{
    
    static let name: ItemNavigationListComponent = ItemNavigationListComponent(
        route: AnyView(NameView()),
        systemName: "person.text.rectangle.fill",
        title: "Nome"
    )
    
    static let email: ItemNavigationListComponent = ItemNavigationListComponent(
        route: AnyView(EmailView()),
        systemName: "person.crop.square.filled.and.at.rectangle.fill",
        title: "E-mail"
    )
    
    static let password: ItemNavigationListComponent = ItemNavigationListComponent(
        route: AnyView(PasswordView()),
        systemName: "lock.rectangle.fill",
        title: "Senha"
    )
    
    static let myPosts: ItemNavigationListComponent = ItemNavigationListComponent(
        route: AnyView(MyPostsView()),
        systemName: "person.crop.rectangle.fill",
        title: "Meus Posts"
    )
    
    static let myFriends: ItemNavigationListComponent = ItemNavigationListComponent(
        route: AnyView(FriendsView()),
        systemName: "person.2.fill",
        title: "Meus Amigos"
    )
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
