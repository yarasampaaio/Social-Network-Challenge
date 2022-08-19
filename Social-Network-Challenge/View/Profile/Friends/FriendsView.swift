//
//  FriendsView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct FriendsView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.users, id: \.id) { user in
                FriendComponent.builItem(userModel: user)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Meus Amigos")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
        .task {
            await viewModel.getUsers()
        }
    }
}



struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
