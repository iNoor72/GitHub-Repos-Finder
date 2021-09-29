//
//  RealAPIFetching.swift
//  RippleReposTests
//
//  Created by Noor Walid on 28/09/2021.
//

import Foundation

import XCTest
import RxSwift
@testable import RippleRepos

class RealAPIFetching: XCTestCase {
    var sut : HomeViewModel!
    var realAPIService : API!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        realAPIService = APIServices.shared
        sut = HomeViewModel(apiService: realAPIService)
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        sut = nil
        realAPIService = nil
        disposeBag = nil
        super.tearDown()
    }
    
    //Real API Fetching must be done using expectation-timeout method
    func test_real_api_data_fetching() {
        let expected = Repositories(total_count: 1, items: [Repo(repoPath: "iNoor72/iNoor72", owner: Owner(name: "Noor El-Din Walid Fathy", imageURL: "https://avatars.githubusercontent.com/u/52334140?v=4"), description: "This is my README profile, you can explore more about me from here 😄", githubLink: "https://github.com/iNoor72/iNoor72")])
        
        let expectation = expectation(description: "APIFetching")
        var repos: Repositories?
        
        //It's not getting inside the closure + the object is always = nil, I tried solving it but ended up with nothing. :(
        sut.getData(for: "iNoor72") {
            reposObj in
            print(reposObj)
            repos = reposObj
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(repos?.total_count, expected.total_count)
    }
}
