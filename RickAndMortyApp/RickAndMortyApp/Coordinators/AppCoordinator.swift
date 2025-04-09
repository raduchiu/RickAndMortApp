//
//  AppCoordinator.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 08/04/25.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow

    private let charactersCoordinator = CharactersCoordinator()
    private let episodesCoordinator = EpisodesCoordinator()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        charactersCoordinator.start()
        episodesCoordinator.start()

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            charactersCoordinator.navigationController,
            episodesCoordinator.navigationController
        ]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
