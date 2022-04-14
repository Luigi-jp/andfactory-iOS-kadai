//
//  UIViewController+.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/14.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true)
    }
}
