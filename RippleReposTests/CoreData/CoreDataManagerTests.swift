//
//  CoreDataManagerTests.swift
//  RippleReposTests
//
//  Created by Noor Walid on 29/09/2021.
//

import Foundation
import CoreData

import XCTest
@testable import RippleRepos

class CoreDataManagerTests: XCTestCase {
    
    var sut : CoreDataManager!
    
    override func setUp() {
        super.setUp()
        sut = CoreDataManager.shared
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_context_thread_type() {
        XCTAssertEqual(NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType, sut.persistentContainer.viewContext.concurrencyType)
    }
    
    func test_settingup_store_type() {
        let storeType = NSSQLiteStoreType
        XCTAssertEqual(storeType, sut.persistentContainer.persistentStoreDescriptions.first?.type)
    }
    
    func test_data_fetching() {
        
    }
    
    func test_data_saving() {
        
    }
}
