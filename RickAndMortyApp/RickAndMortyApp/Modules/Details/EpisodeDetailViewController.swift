//
//  EpisodeDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 09/04/25.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    private let episode: Episode
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()

    init(episode: Episode) {
        self.episode = episode
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViews()
    }

    private func setupViews() {
        nameLabel.text = episode.name
        dateLabel.text = "\(episode.episode) - \(episode.air_date)"
        nameLabel.textColor = .white
        dateLabel.textColor = .gray
        nameLabel.font = .boldSystemFont(ofSize: 24)
        dateLabel.font = .systemFont(ofSize: 18)
        nameLabel.textAlignment = .center
        dateLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [nameLabel, dateLabel])
        stack.axis = .vertical
        stack.spacing = 8
        view.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
