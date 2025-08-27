//
//  ContentView.swift
//  act06_playersapi
//
//  Created by marielgonzalezg on 25/08/25.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var playerViewModel = PlayerViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Image("atp")
                    .resizable()
                    .frame(width: 150, height: 100)
                    .padding(.vertical, 10)

                if playerViewModel.isLoading {
                    ProgressView("Loading players...")
                        .padding()
                } else if let error = playerViewModel.errorMessage {
                    VStack(spacing: 10) {
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()

                        Button(action: {
                            Task {
                                await playerViewModel.fetchPlayers()
                            }
                        }) {
                            Label("Retry", systemImage: "arrow.clockwise")
                        }
                        .padding(.top, 5)
                    }
                } else {
                    List {
                        Text("Players")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 10)

                        ForEach(playerViewModel.arrPlayers) { player in
                            NavigationLink {
                                PlayerDetailView(player: player)
                            } label: {
                                PlayerRowView(player: player)
                            }
                        }
                    }
                    .refreshable {
                        Task {
                            await playerViewModel.fetchPlayers()
                        }
                    }
                }

            }

            // Bottom nav bar
            HStack(spacing: 30) {
                VStack {
                    Image(systemName: "house").font(.system(size: 25))
                    Text("Home").font(.caption)
                }
                VStack {
                    Image(systemName: "tennisball.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.blue)
                    Text("Players").font(.caption)
                }
                VStack {
                    Image(systemName: "play.square.stack").font(.system(size: 25))
                    Text("Matches").font(.caption)
                }
                VStack {
                    Image(systemName: "chart.bar").font(.system(size: 25))
                    Text("Ranking").font(.caption)
                }
                VStack {
                    Image(systemName: "ellipsis").font(.system(size: 25))
                    Text("More").font(.caption)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
