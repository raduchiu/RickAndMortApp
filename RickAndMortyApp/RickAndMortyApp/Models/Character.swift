//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 08/04/25.
//

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}
