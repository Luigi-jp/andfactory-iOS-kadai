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
        let model = SearchUserModel()
        let presenter = SearchUserPresenter(view: vc, model: model)
        vc.inject(presenter: presenter)
        return vc
    }

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var notFoundLabel: UILabel!

    private var presenter: SearchUserPresenterInput!
    private func inject(presenter: SearchUserPresenterInput) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search User"
        tableView.register(UserCell.nib, forCellReuseIdentifier: UserCell.identifier)
        searchBar.autocapitalizationType = .none

        tableView.isHidden = true
        indicator.isHidden = true
        notFoundLabel.isHidden = true
    }
}

extension SearchUserViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.didTapSearchButton(searchWord: searchBar.text)
    }
}

extension SearchUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfUsers
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell else {
            fatalError("セルの再利用に失敗しました。")
        }
        let user = presenter.user(index: indexPath.row)
        cell.configure(item: user)
        return cell
    }
}

extension SearchUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRow(index: indexPath.row)
    }
}

extension SearchUserViewController: SearchUserPresenterOutput {
    func updateUsers(users: [User]) {
        DispatchQueue.main.async {
            if users.isEmpty {
                self.tableView.isHidden = true
                self.notFoundLabel.isHidden = false
                return
            }
            self.notFoundLabel.isHidden = true
            self.tableView.reloadData()
        }
    }

    func errorOccureed(error: Error) {
        DispatchQueue.main.async {
            let okAction = UIAlertAction(title: "OK", style: .default)
            self.showErrorAlert(message: error.localizedDescription, actions: [okAction])
        }
    }

    func loading(load: Bool) {
        DispatchQueue.main.async {
            self.tableView.isHidden = load
            self.indicator.isHidden = !load
        }
    }

    func showUserDetail(user: User) {
        DispatchQueue.main.async {
            let vc = UserDetailViewController.makeFromStoryboard(user: user)
            if let nav = self.navigationController {
                nav.pushViewController(vc, animated: true)
            } else {
                self.present(vc, animated: true)
            }
        }
    }
}
