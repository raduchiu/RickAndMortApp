//
//  EpisodeCell.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 09/04/25.
//

import UIKit

class EpisodeCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let codeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        nameLabel.textColor = .white
        codeLabel.textColor = .gray
        setup()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        let stack = UIStackView(arrangedSubviews: [nameLabel, codeLabel])
        stack.axis = .vertical
        stack.spacing = 4
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    func configure(with episode: Episode) {
        nameLabel.text = episode.name
        codeLabel.text = "\(episode.episode) • \(episode.air_date)"
    }
}
