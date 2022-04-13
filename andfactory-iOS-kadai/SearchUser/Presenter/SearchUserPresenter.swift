//
//  SearchUserPresenter.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import Foundation

protocol SearchUserPresenterInput {
    var numberOfUsers: Int { get }
    func didTapSearchButton(searchWord: String?)
    func user(index: Int) -> User
}

protocol SearchUserPresenterOutput: AnyObject {
    func updateUsers(users: [User])
    func errorOccureed(error: Error)
    func loading(load: Bool)
}

final class SearchUserPresenter {
    private var users: [User] = []

    private weak var view: SearchUserPresenterOutput!
    private var model: SearchUserModel

    init(view: SearchUserPresenterOutput, model: SearchUserModel) {
        self.view = view
        self.model = model
    }
}

extension SearchUserPresenter: SearchUserPresenterInput {
    var numberOfUsers: Int {
        return users.count
    }

    func didTapSearchButton(searchWord: String?) {
        let parameters = SearchUserParameter(searchWord: searchWord)
        view.loading(load: true)

        model.fetchUser(parameters: parameters) { result in
            self.view.loading(load: false)

            switch result {
            case .success(let users):
                self.users = users
                self.view.updateUsers(users: users)
            case .failure(let error):
                self.view.errorOccureed(error: error)
            }
        }
    }

    func user(index: Int) -> User {
        return users[index]
    }
}
