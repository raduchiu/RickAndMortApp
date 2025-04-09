//
//  EpisodesCoordinator.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 08/04/25.
//

import UIKit

class EpisodesCoordinator {
    let navigationController = UINavigationController()

    func start() {
        let viewModel = EpisodesViewModel()
        let viewController = EpisodesViewController(viewModel: viewModel)
        viewModel.didSelectEpisode = { [weak self] episode in
            let detailVC = EpisodeDetailViewController(episode: episode)
            self?.navigationController.pushViewController(detailVC, animated: true)
        }
        viewController.title = "Episodes"
        navigationController.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 1)
        navigationController.viewControllers = [viewController]
    }
}
