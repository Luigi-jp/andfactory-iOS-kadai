//
//  SearchUserPresenterTests.swift
//  andfactory-iOS-kadaiTests
//
//  Created by 佐藤瑠偉史 on 2022/04/14.
//

import XCTest
@testable import andfactory_iOS_kadai

class SearchUserPresenterOutputSpy: SearchUserPresenterOutput {
    var calledUpdateUsers: (([User]) -> Void)?
    var calledErrorOccureed: ((Error) -> Void)?
    var calledLoading: ((Bool) -> Void)?
    var calledShowUserDetail: ((User) -> Void)?

    func updateUsers(users: [User]) {
        calledUpdateUsers?(users)
    }

    func errorOccurred(error: Error) {
        calledErrorOccureed?(error)
    }

    func loading(load: Bool) {
        calledLoading?(load)
    }

    func showUserDetail(user: User) {
        calledShowUserDetail?(user)
    }
}

class SearchUserModelInputStub: SearchUserModelInput {
    private var fetchUserResponse: Result<[User], Error>?

    func addFetchUserResponse(result: Result<[User], Error>) {
        fetchUserResponse = result
    }

    func fetchUser(parameters: SearchUserParameter, completion: @escaping ((Result<[User], Error>) -> Void)) {
        guard let response = fetchUserResponse else {
            fatalError("レスポンスが存在しません。")
        }
        completion(response)
    }
}

class SearchUserPresenterTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testDidTapSearchButton() {
        XCTContext.runActivity(named: "ユーザー検索成功時") { _ in
            let spy = SearchUserPresenterOutputSpy()
            let stub = SearchUserModelInputStub()
            let presenter = SearchUserPresenter(view: spy, model: stub)

            let searchWord = "Apple"
            let users = [User(login: "testUser", avatarUrlStr: "https://dummy", type: "User", htmlUrlStr: "https://dummy")]
            stub.addFetchUserResponse(result: .success(users))

            let startOfLoadExpectation = XCTestExpectation(description: "検索の開始")
            let endOfLoadExpectation = XCTestExpectation(description: "検索の終了")
            let updateUsersExpectation = XCTestExpectation(description: "usersのアップデート")

            spy.calledLoading = { load in
                if load {
                    startOfLoadExpectation.fulfill()
                } else {
                    endOfLoadExpectation.fulfill()
                }
            }

            spy.calledUpdateUsers = { users in
                updateUsersExpectation.fulfill()
            }

            presenter.didTapSearchButton(searchWord: searchWord)
            wait(for: [startOfLoadExpectation, endOfLoadExpectation, updateUsersExpectation], timeout: 1.0)
        }

        XCTContext.runActivity(named: "ユーザー検索失敗時") { _ in
            let spy = SearchUserPresenterOutputSpy()
            let stub = SearchUserModelInputStub()
            let presenter = SearchUserPresenter(view: spy, model: stub)

            let searchWord = "Apple"
            stub.addFetchUserResponse(result: .failure(APIError.invalidResponse))

            let startOfLoadExpectation = XCTestExpectation(description: "検索の開始")
            let endOfLoadExpectation = XCTestExpectation(description: "検索の終了")
            let errorOccurredExpectation = XCTestExpectation(description: "エラー発生")

            spy.calledLoading = { load in
                if load {
                    startOfLoadExpectation.fulfill()
                } else {
                    endOfLoadExpectation.fulfill()
                }
            }

            spy.calledErrorOccureed = { error in
                errorOccurredExpectation.fulfill()
            }

            presenter.didTapSearchButton(searchWord: searchWord)
            wait(for: [startOfLoadExpectation, endOfLoadExpectation, errorOccurredExpectation], timeout: 1.0)
        }
    }

    func testNumberOfUsers() {
        XCTContext.runActivity(named: "usersのcount取得時") { _ in
            let spy = SearchUserPresenterOutputSpy()
            let stub = SearchUserModelInputStub()
            let presenter = SearchUserPresenter(view: spy, model: stub)

            let searchWord = "Apple"
            let users = [User(login: "testUser", avatarUrlStr: "https://dummy", type: "User", htmlUrlStr: "https://dummy")]
            stub.addFetchUserResponse(result: .success(users))

            presenter.didTapSearchButton(searchWord: searchWord)

            XCTAssertTrue(presenter.numberOfUsers == 1)
        }
    }

    func testDidSelectRow() {
        XCTContext.runActivity(named: "ユーザー選択時") { _ in
            let spy = SearchUserPresenterOutputSpy()
            let stub = SearchUserModelInputStub()
            let presenter = SearchUserPresenter(view: spy, model: stub)

            let searchWord = "Apple"
            let users = [User(login: "testUser", avatarUrlStr: "https://dummy", type: "User", htmlUrlStr: "https://dummy")]
            stub.addFetchUserResponse(result: .success(users))

            let showUserDetailExpectation = XCTestExpectation(description: "ユーザー詳細ページへ遷移")
            spy.calledShowUserDetail = { user in
                showUserDetailExpectation.fulfill()
            }

            presenter.didTapSearchButton(searchWord: searchWord)
            presenter.didSelectRow(index: 0)
            wait(for: [showUserDetailExpectation], timeout: 1.0)
        }
    }
}
