//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 09/04/25.
//

import Foundation

class EpisodesViewModel {
    var episodes: [Episode] = []
    var currentPage = 1
    var isLoading = false
    var didLoad: (() -> Void)?
    var didSelectEpisode: ((Episode) -> Void)?

    func fetchEpisodes() {
        guard !isLoading else { return }
        isLoading = true

        APIService.shared.fetchEpisodes(page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.episodes.append(contentsOf: response.results)
                    self?.currentPage += 1
                    self?.didLoad?()
                case .failure(let error):
                    print("Error fetching episodes: \(error)")
                }
            }
        }
    }

    func didSelectItem(at index: Int) {
        let episode = episodes[index]
        didSelectEpisode?(episode)
    }
}
