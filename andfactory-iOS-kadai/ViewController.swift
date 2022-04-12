//
//  ViewController.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/12.
//

import UIKit

final class ViewController: UIViewController {
    static func makeFromStoryboard() -> ViewController {
        let vc = UIStoryboard.viewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
