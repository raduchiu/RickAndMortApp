//
//  APIResponse.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 08/04/25.
//

struct APIResponse<T: Decodable>: Decodable {
    let info: Info
    let results: [T]

    struct Info: Decodable {
        let count: Int
        let pages: Int
        let next: String?
    }
}
