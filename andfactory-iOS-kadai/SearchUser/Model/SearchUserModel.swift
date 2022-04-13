//
//  SearchUserModel.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import Foundation
import Alamofire

protocol SearchUserModelInput {
    func fetchUser(parameters: SearchUserParameter, completion: @escaping ((Result<[User], Error>) -> Void))
}

final class SearchUserModel: SearchUserModelInput {
    func fetchUser(parameters: SearchUserParameter, completion: @escaping ((Result<[User], Error>) -> Void)) {
        guard let encodeParameters = parameters.queryParameters.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(APIError.unknown))
            return
        }

        let query = "https://api.github.com/search/users?\(encodeParameters)"
        AF.request(query).response { response in
            guard let data = response.data else {
                completion(.failure(APIError.invalidResponse))
                return
            }

            do {
                let searchUserResponse = try JSONDecoder().decode(SearchUserResponse.self, from: data)
                completion(.success(searchUserResponse.items))
            } catch {
                completion(.failure(APIError.unknown))
            }
        }
    }
}
