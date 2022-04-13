//
//  SearchUserViewController.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/12.
//

import UIKit

final class SearchUserViewController: UIViewController {
    static func makeFromStoryboard() -> SearchUserViewController {
        let vc = UIStoryboard.searchUserViewController
        return vc
    }

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search User"
        tableView.register(UserCell.nib, forCellReuseIdentifier: UserCell.identifier)
    }
}

extension SearchUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell else {
            fatalError()
        }
        return cell
    }
}
