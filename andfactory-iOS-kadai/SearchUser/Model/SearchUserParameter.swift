//
//  SearchUserParameter.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import Foundation

struct SearchUserParameter {
    let searchWord: String?
    var q: String { searchWord ?? "" }
    let order: Order = .desc
    let perPage: Int = 30
    let page: Int = 1

    var queryParameters: String {
        return "q=\(q)&order=\(order.rawValue)&per_page=\(perPage)&page=\(page)"
    }

    enum Order: String {
        case asc
        case desc
    }
}
