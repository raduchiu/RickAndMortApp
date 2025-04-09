//
//  CharacterCell.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 09/04/25.
//

import UIKit

class CharacterCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let avatar = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        nameLabel.textColor = .white
        avatar.contentMode = .scaleAspectFill
        avatar.clipsToBounds = true
        setup()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setup() {
        addSubview(avatar)
        addSubview(nameLabel)

        avatar.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatar.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 60),
            avatar.heightAnchor.constraint(equalToConstant: 60),

            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    func configure(with character: Character) {
        nameLabel.text = character.name
        if let url = URL(string: character.image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.avatar.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
