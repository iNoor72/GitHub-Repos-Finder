//
//  Database.swift
//  Ripple-Task
//
//  Created by Noor Walid on 27/09/2021.
//

import Foundation

protocol Database {
    func save()
    func fetch() -> [RepoModel]
}
