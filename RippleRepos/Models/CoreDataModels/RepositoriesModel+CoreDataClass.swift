//
//  RepositoriesModel+CoreDataClass.swift
//  RippleRepos
//
//  Created by Noor Walid on 29/09/2021.
//
//

import Foundation
import CoreData


public class RepositoriesModel: NSManagedObject, Codable {
    enum CodingKeys: String, CodingKey {
        case items
    }
    public required convenience init(from decoder: Decoder) throws {
        
        //The error comes from here, it returns fatalError.
        guard let managedObjectContext = decoder.userInfo[CodingUserInfoKey.managedObjectContext!] as? NSManagedObjectContext else { fatalError() }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "RepositoriesModel", in: managedObjectContext) else { fatalError() }

        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([RepoModel].self, forKey: .items)
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(items, forKey: .items)
    }
    
}

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

