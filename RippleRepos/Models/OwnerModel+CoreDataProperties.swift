//
//  OwnerModel+CoreDataProperties.swift
//  RippleRepos
//
//  Created by Noor Walid on 29/09/2021.
//
//

import Foundation
import CoreData


extension OwnerModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OwnerModel> {
        return NSFetchRequest<OwnerModel>(entityName: "OwnerModel")
    }

    @NSManaged public var imageURL: String?
    @NSManaged public var name: String?

}

extension OwnerModel : Identifiable {

}
