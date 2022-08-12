//
//  Social_Network_ChallengeApp.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 10/08/22.
//

import SwiftUI

@main
struct Social_Network_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ExploreView()
                    .tabItem {
                        Label("Explorar", systemImage: "safari.fill")
                    }

                ProfileView()
                    .tabItem {
                        Label("Perfil", systemImage: "person.fill")
                    }
            }
            //ExploreView()
        }
    }
}
