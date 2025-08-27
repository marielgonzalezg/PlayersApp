//
//  PlayerViewModel.swift
//  act06_playersapi
//
//  Created by marielgonzalezg on 25/08/25.
//


import Foundation
import Network

@MainActor
class PlayerViewModel: ObservableObject {
    @Published var arrPlayers: [Player] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    init() {
        monitor.pathUpdateHandler = { path in
            if path.status != .satisfied {
                Task { @MainActor in
                    self.errorMessage = "No connection. Please try again."
                    self.isLoading = false
                }
            }
        }
        monitor.start(queue: queue)
        
        Task {
            await fetchPlayers()
        }
    }
    
    func fetchPlayers() async {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://players-api-n6ux.onrender.com/players") else {
            self.errorMessage = "Invalid URL."
            self.isLoading = false
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                self.errorMessage = "Server error (code: \(httpResponse.statusCode))"
                self.isLoading = false
                return
            }

            let players = try JSONDecoder().decode([Player].self, from: data)
            self.arrPlayers = players

        } catch is CancellationError {
            // Task was cancelled (e.g., pull-to-refresh), ignore it
            return
        } catch {
            self.errorMessage = "Failed to load players: \(error.localizedDescription)"
        }

        isLoading = false
    }

}
