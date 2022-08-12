//
//  ProfileView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 11/08/22.
//

import SwiftUI

struct ProfileView: View{
    
    var body: some View{
        NavigationView{
            VStack(spacing: 20){
                Circle()
                    .fill(Color.accentColor)
                    .frame(
                        width: SizesComponents.widthScreen*0.6,
                        height: SizesComponents.widthScreen*0.6
                    )
                Spacer()
                List {
                    Section(header: Text("Dados Pessoais"),
                            content: {
                        
                        ItemNavigationListComponent.buildItem(itemProfile: ItensProfile.name)
                        
                        ItemNavigationListComponent.buildItem(itemProfile: ItensProfile.email)
                    }
                    )
                }.listStyle(.insetGrouped)
            }.navigationTitle("Perfil")
            
        }.ignoresSafeArea()
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
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
