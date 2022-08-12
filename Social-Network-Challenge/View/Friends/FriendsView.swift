//
//  FriendsView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        List {
            ForEach(myFriends, id: \.id) { friend in
                FriendComponent.builItem(userModel: friend)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Meus Amigos")
        .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
    }
}



struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
