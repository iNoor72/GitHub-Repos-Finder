//
//  RepoModel+CoreDataProperties.swift
//  RippleRepos
//
//  Created by Noor Walid on 29/09/2021.
//
//

import Foundation
import CoreData


extension RepoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepoModel> {
        return NSFetchRequest<RepoModel>(entityName: "RepoModel")
    }

    @NSManaged public var owner: OwnerModel?
    @NSManaged public var repoDescription: String?
    @NSManaged public var repoPath: String?
    @NSManaged public var repoOwner: OwnerModel?

}

extension RepoModel : Identifiable {

}
