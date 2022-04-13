//
//  UserDetailPresenter.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/14.
//

import Foundation

protocol UserDetailPresenterInput {
    func viewDidLoad()
}

protocol UserDetailPresenterOutput: AnyObject {
    func load(request: URLRequest)
    func update(title: String)
}

final class UserDetailPresenter {
    private var user: User

    private weak var view: UserDetailPresenterOutput!

    init(user: User, view: UserDetailPresenterOutput) {
        self.user = user
        self.view = view
    }
}

extension UserDetailPresenter: UserDetailPresenterInput {
    func viewDidLoad() {
        guard let url = URL(string: user.htmlUrlStr) else { return }
        view.load(request: URLRequest(url: url))

        view.update(title: user.login)
    }
}
