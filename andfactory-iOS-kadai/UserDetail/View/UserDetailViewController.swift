//
//  UserDetailViewController.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/14.
//

import UIKit
import WebKit

final class UserDetailViewController: UIViewController {
    static func makeFromStoryboard(user: User) -> UserDetailViewController {
        let vc = UIStoryboard.userDetailViewController
        let presenter = UserDetailPresenter(user: user, view: vc)
        vc.inject(presenter: presenter)
        return vc
    }

    @IBOutlet private weak var webView: WKWebView!

    private var presenter: UserDetailPresenterInput!
    private func inject(presenter: UserDetailPresenterInput) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension UserDetailViewController: UserDetailPresenterOutput {
    func load(request: URLRequest) {
        DispatchQueue.main.async {
            self.webView.load(request)
        }
    }

    func update(title: String) {
        DispatchQueue.main.async {
            self.navigationItem.title = title
        }
    }
}
