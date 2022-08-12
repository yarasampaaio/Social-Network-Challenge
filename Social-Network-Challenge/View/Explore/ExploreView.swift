//
//  ExploreView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        let columnCount: Int = 2
        let gridSpacing: CGFloat = 4

        ScrollView(.vertical) {
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: columnCount), spacing: gridSpacing) {
                Image("Explorar")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: SizesComponents.widthSecond/3
                    )
                Image("MeusAmigos")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: SizesComponents.widthSecond/3
                    )
                Image("Feed")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: SizesComponents.widthSecond/3
                    )
            }
        }    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
