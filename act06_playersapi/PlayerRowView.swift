//
//  PlayerRowView.swift
//  act06_playersapi
//
//  Created by marielgonzalezg on 25/08/25.
//


import SwiftUI

struct PlayerRowView: View {
    let player: Player

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: player.imageUrl)) { image in
                image.resizable()
                     .scaledToFit()
                     .frame(width: 120, height: 90)
                     .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }

            Text(player.name)
                .font(.headline)
                .padding(.leading, 10)
        }

    }
}

#Preview {
    ContentView()
}
