//
//  UITableViewCell+.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import UIKit

extension UITableViewCell {
    static var identifier: String { String(describing: Self.self) }
    static var nib: UINib { UINib(nibName: identifier, bundle: nil) }
}
