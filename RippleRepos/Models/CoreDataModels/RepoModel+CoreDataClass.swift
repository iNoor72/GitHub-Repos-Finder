//
//  RepoModel+CoreDataClass.swift
//  RippleRepos
//
//  Created by Noor Walid on 29/09/2021.
//
//

import Foundation
import CoreData


public class RepoModel: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case repoPath = "full_name"
        case owner
        case repoDescription
        case githubLink = "html_url"
    }
    public required convenience init(from decoder: Decoder) throws {
        guard let managedObjectContext = decoder.userInfo[CodingUserInfoKey.managedObjectContext!] as? NSManagedObjectContext else { fatalError() }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "RepoModel", in: managedObjectContext) else { fatalError() }

        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.repoPath = try container.decodeIfPresent(String.self, forKey: .repoPath)
        self.repoDescription = try container.decodeIfPresent(String.self, forKey: .repoDescription)
        self.owner = try container.decodeIfPresent(OwnerModel.self, forKey: .owner)
        self.githubLink = try container.decodeIfPresent(String.self, forKey: .githubLink)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(repoPath, forKey: .repoPath)
        try container.encodeIfPresent(repoDescription, forKey: .repoDescription)
        try container.encodeIfPresent(owner, forKey: .owner)
        try container.encodeIfPresent(githubLink, forKey: .githubLink)

        
    }

}

