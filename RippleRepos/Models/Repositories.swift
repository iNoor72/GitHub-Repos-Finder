//
//  Repositories.swift
//  Ripple-Task
//
//  Created by Noor Walid on 24/09/2021.
//

import Foundation

struct Repositories: Codable {
    var total_count : Int
    var items: [Repo]
}

struct Repo: Codable {
    var repoPath: String
    var owner: Owner
    var description: String?
    var githubLink: String

    enum CodingKeys: String, CodingKey {
        case repoPath = "full_name"
        case owner
        case description
        case githubLink = "html_url"
    }
}

struct Owner: Codable {
    var name: String
    var imageURL: String

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageURL = "avatar_url"
    }
}
