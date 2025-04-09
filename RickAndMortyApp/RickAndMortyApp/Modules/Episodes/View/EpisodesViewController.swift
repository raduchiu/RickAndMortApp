//
//  EpisodesViewController.swift
//  RickAndMortyApp
//
//  Created by Raduchiu Amaral on 09/04/25.
//

import UIKit

class EpisodesViewController: UIViewController {
    private let viewModel: EpisodesViewModel
    private let tableView = UITableView()

    init(viewModel: EpisodesViewModel) {
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
        viewModel.fetchEpisodes()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .black
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: "EpisodeCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension EpisodesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.episodes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
        let episode = viewModel.episodes[indexPath.row]
        cell.configure(with: episode)

        if indexPath.row == viewModel.episodes.count - 1 {
            viewModel.fetchEpisodes()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row)
    }
}
