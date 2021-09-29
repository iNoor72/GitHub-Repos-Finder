//
//  OwnerModel+CoreDataClass.swift
//  RippleRepos
//
//  Created by Noor Walid on 29/09/2021.
//
//

import Foundation
import CoreData

public class OwnerModel: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case imageURL = "avatar_url"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let managedObjectContext = decoder.userInfo[CodingUserInfoKey.managedObjectContext!] as? NSManagedObjectContext else { fatalError() }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "OwnerModel", in: managedObjectContext) else { fatalError() }

        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.imageURL = try container.decodeIfPresent(String.self, forKey: .imageURL)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(imageURL, forKey: .imageURL)
    }

}
