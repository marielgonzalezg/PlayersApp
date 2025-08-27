//
//  Player.swift
//  act06_playersapi
//
//  Created by marielgonzalezg on 25/08/25.
//


import Foundation

struct Player: Identifiable, Decodable {
    var id = UUID()
    var name: String
    var imageUrl: String
    var country: String
    var countryFlagUrl: String
    var gifUrl: String

    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl
        case country
        case countryFlagUrl
        case gifUrl
    }
}
