//
//  UIStoryboard+.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import UIKit

extension UIStoryboard {
    static var searchUserViewController: SearchUserViewController {
        UIStoryboard(name: "SearchUser", bundle: nil).instantiateInitialViewController() as! SearchUserViewController
    }

    static var userDetailViewController: UserDetailViewController {
        UIStoryboard(name: "UserDetail", bundle: nil).instantiateInitialViewController() as! UserDetailViewController
    }
}
