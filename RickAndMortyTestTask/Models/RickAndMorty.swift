//
//  RickAndMorty.swift
//  RickAndMortyTestTask
//
//  Created by Kirill Taraturin on 17.08.2023.
//

import Foundation

struct RickAndMorty: Codable {
    var info: Info
    var results: [Character]
}

struct Info: Codable {
    var count: Int
    var pages: Int
    var next: String
    var prev: String?
}

struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Origin
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

struct Origin: Codable {
    var name: String
    var url: String
}
