//
//  ContentView.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 10/08/22.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject private var viewModel = ViewModel() // ObservedObject
        
    var body: some View {
        
        NavigationView{
            List(viewModel.users, id: \.id) { user in
                VStack(alignment: .leading){
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                        .font(.body)
                }
            }
            .navigationTitle("Cadastrados")
            .task {
                await viewModel.getUsers()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
