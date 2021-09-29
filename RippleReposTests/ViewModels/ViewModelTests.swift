//
//  ViewModelTests.swift
//  RippleRepos-TaskTests
//
//  Created by Noor Walid on 28/09/2021.
//

import XCTest
@testable import RippleRepos

class ViewModelTests: XCTestCase {
    
    var sut : DetailsViewModel!
    var repo : Repo!
    
    override func setUp() {
        super.setUp()
        repo = Repo(repoPath: "", owner: Owner(name: "", imageURL: ""), description: "NO DESC", githubLink: "")
        sut = DetailsViewModel(repo: repo)
    }
    
    override func tearDown() {
        sut = nil
        repo = nil
        super.tearDown()
    }
    
    
    func test_details_viewmodel_data_passing() {
        let expected = Repo(repoPath: "", owner: Owner(name: "", imageURL: ""), description: "NO DESC", githubLink: "")
        
        XCTAssertEqual(sut.repoNameBehaviour.value, expected.repoPath)
        XCTAssertEqual(sut.repoLinkBehaviour.value, expected.githubLink)
        XCTAssertEqual(sut.descriptionBehaviour.value, expected.description)
        XCTAssertEqual(sut.usernameBehaviour.value, expected.owner.name)
        
    }
    
}
