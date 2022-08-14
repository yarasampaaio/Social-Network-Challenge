//
//  MyTabView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explorar", systemImage: "safari.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Perfil", systemImage: "person.fill")
                }
        }    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
