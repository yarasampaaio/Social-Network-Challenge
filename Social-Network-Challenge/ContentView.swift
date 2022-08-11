//
//  ContentView.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 10/08/22.
//

import SwiftUI


struct ContentView: View {
    @State private var users = [User]()
        
    var body: some View {
        
        NavigationView{
            List(users, id: \.id) { users in
                VStack(alignment: .leading){
                    Text(users.name)
                        .font(.headline)
                    Text(users.email)
                    font(.body)
                }
            }
            .navigationTitle("Cadastrados")
            .task {
                await getUsers()
            }
        }
    }
    
    func getUsers() async {
        //criando url
        guard let url = URL(string: "http://adaspace.local/users") else
        {
            print("Nao ta funcionando")
            return
        }
        //buscando dados da url em questao
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode that data
            if let decodeResponde = try?JSONDecoder().decode([User].self, from: data) {
                users = decodeResponde
            }
        } catch {
            print("this data isn't valid")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
