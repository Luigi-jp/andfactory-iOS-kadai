//
//  UIStoryboard+.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import UIKit

extension UIStoryboard {
    static var viewController: ViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
    }
}
