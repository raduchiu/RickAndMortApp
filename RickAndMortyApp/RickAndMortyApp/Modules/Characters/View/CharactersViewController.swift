//
//  CharactersViewController.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 09/04/25.
//

import UIKit

class CharactersViewController: UIViewController {
    private let viewModel: CharactersViewModel
    private let tableView = UITableView()

    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.didLoad = { [weak self] in
            self?.tableView.reloadData()
        }
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupTableView()
        viewModel.fetchCharacters()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .black
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        let character = viewModel.characters[indexPath.row]
        cell.configure(with: character)

        if indexPath.row == viewModel.characters.count - 1 {
            viewModel.fetchCharacters()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row)
    }
}
