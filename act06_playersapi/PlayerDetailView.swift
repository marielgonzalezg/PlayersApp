//
//  PlayerDetailView.swift
//  act06_playersapi
//
//  Created by marielgonzalezg on 25/08/25.
//


import SwiftUI

struct PlayerDetailView: View {
    let player: Player

    var body: some View {
        
        
        ScrollView {
            VStack {
                Image("atp")
                    .resizable()
                    .frame(width: 150, height: 100)
                    .padding(.vertical, 10)
                
                AsyncImage(url: URL(string: player.imageUrl)) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(width: 250, height: 300)
                } placeholder: {
                    ProgressView()
                }

                Text(player.name)
                    .font(.title)
                    .fontWeight(.bold)

                HStack {
                    Text("Country:")
                        .fontWeight(.bold)
                    Text(player.country)
                    AsyncImage(url: URL(string: player.countryFlagUrl)) { image in
                        image.resizable()
                             .scaledToFit()
                             .clipShape(Circle())
                             .frame(width: 25, height: 25)
                    } placeholder: {
                        ProgressView()
                    }
                }

                AsyncImage(url: URL(string: player.gifUrl)) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(height: 300)
                         .clipped()
                         .padding(.horizontal, 30)
                } placeholder: {
                    ProgressView()
                }
            }

        }
        .navigationTitle(player.name)
    }
}

#Preview {
    ContentView()
}
