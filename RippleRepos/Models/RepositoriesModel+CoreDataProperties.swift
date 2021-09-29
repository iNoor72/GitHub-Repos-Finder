//
//  RepositoriesModel+CoreDataProperties.swift
//  RippleRepos
//
//  Created by Noor Walid on 29/09/2021.
//
//

import Foundation
import CoreData


extension RepositoriesModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepositoriesModel> {
        return NSFetchRequest<RepositoriesModel>(entityName: "RepositoriesModel")
    }

    @NSManaged public var items: [RepoModel]?
    @NSManaged public var repos: NSSet?

}

// MARK: Generated accessors for repos
extension RepositoriesModel {

    @objc(addReposObject:)
    @NSManaged public func addToRepos(_ value: RepoModel)

    @objc(removeReposObject:)
    @NSManaged public func removeFromRepos(_ value: RepoModel)

    @objc(addRepos:)
    @NSManaged public func addToRepos(_ values: NSSet)

    @objc(removeRepos:)
    @NSManaged public func removeFromRepos(_ values: NSSet)

}

extension RepositoriesModel : Identifiable {

}
