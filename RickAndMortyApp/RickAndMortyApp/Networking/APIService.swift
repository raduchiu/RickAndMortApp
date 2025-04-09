//
//  APIService.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 08/04/25.
//

import Foundation

class APIService {
    static let shared = APIService()

    private let baseURL = "https://rickandmortyapi.com/api"

    func fetchCharacters(page: Int, completion: @escaping (Result<APIResponse<Character>, Error>) -> Void) {
        fetch(endpoint: "/character?page=\(page)", completion: completion)
    }

    func fetchEpisodes(page: Int, completion: @escaping (Result<APIResponse<Episode>, Error>) -> Void) {
        fetch(endpoint: "/episode?page=\(page)", completion: completion)
    }

    private func fetch<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(NSError(domain: "URL Error", code: 0)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0)))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
