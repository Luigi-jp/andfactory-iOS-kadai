//
//  APIError.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/14.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "データの取得に失敗しました。しばらくしてからもう一度お試しください。"
        case .unknown:
            return "想定外のエラーが発生しました。"
        }
    }
}
