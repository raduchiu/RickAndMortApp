//
//  CharactersCoordinator.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 08/04/25.
//

import UIKit

class CharactersCoordinator {
    let navigationController = UINavigationController()

    func start() {
        let viewModel = CharactersViewModel()
        viewModel.didSelectCharacter = { [weak self] character in
            let detailVC = CharacterDetailViewController(character: character)
            self?.navigationController.pushViewController(detailVC, animated: true)
        }

        let viewController = CharactersViewController(viewModel: viewModel)
        viewController.title = "Characters"
        navigationController.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.3"), tag: 0)
        navigationController.viewControllers = [viewController]
    }
}
