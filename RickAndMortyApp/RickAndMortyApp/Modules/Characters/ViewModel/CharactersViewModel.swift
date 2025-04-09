//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 08/04/25.
//

import Foundation

class CharactersViewModel {
    var characters: [Character] = []
    var currentPage = 1
    var isLoading = false
    var didLoad: (() -> Void)?
    var didSelectCharacter: ((Character) -> Void)?

    func fetchCharacters() {
        guard !isLoading else { return }
        isLoading = true

        APIService.shared.fetchCharacters(page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.characters.append(contentsOf: response.results)
                    self?.currentPage += 1
                    self?.didLoad?()
                case .failure(let error):
                    print("Error fetching characters: \(error)")
                }
            }
        }
    }

    func didSelectItem(at index: Int) {
        let character = characters[index]
        print("Selected character: \(character.name)")
        didSelectCharacter?(character)
    }
}

