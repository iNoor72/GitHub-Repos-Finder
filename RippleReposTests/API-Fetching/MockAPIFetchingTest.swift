//
//  RippleReposTests.swift
//  RippleReposTests
//
//  Created by Noor Walid on 24/09/2021.
//

import XCTest
@testable import RippleRepos

class MockAPIFetching: XCTestCase {
    var sut : HomeViewModel!
    var mockAPIService : API!
    
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIServices.shared
        sut = HomeViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        sut = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_mock_api_data_fetching_with_iNoor72() {
        let expected = Repositories(total_count: 1, items: [Repo(repoPath: "iNoor72/iNoor72", owner: Owner(name: "Noor El-Din Walid Fathy", imageURL: "https://avatars.githubusercontent.com/u/52334140?v=4"), description: "This is my README profile, you can explore more about me from here 😄", githubLink: "https://github.com/iNoor72/iNoor72")])
        
        //Not getting inside the call
        sut.getData(for: "iNoor72") {
            reposObj in
            guard let reposObj = reposObj else { return }
            XCTAssertEqual(reposObj.total_count, expected.total_count)
            XCTAssertEqual(reposObj.items.count, expected.items.count)
            XCTAssertEqual(reposObj.items.first?.description, expected.items.first?.description)
        }
    }
    
    func test_mock_api_data_fetching_with_any_query() {
        let expected = Repositories(total_count: 3, items: [Repo(repoPath: "", owner: Owner(name: "", imageURL: ""), description: "Mock description for repo 1", githubLink: ""),Repo(repoPath: "", owner: Owner(name: "", imageURL: ""), description: "", githubLink: ""),Repo(repoPath: "", owner: Owner(name: "", imageURL: ""), description: "", githubLink: "")])
        
        //Not getting inside the call
        sut.getData(for: "HelloWorld") {
            reposObj in
            guard let reposObj = reposObj else { return }
            XCTAssertEqual(reposObj.total_count, expected.total_count)
            XCTAssertEqual(reposObj.items.count, expected.items.count)
            XCTAssertEqual(reposObj.items.first?.description, expected.items.first?.description)
        }
        
    }
}
