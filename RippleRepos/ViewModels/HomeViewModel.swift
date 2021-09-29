//
//  HomeViewModel.swift
//  Ripple-Task
//
//  Created by Noor Walid on 24/09/2021.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class HomeViewModel {
    
    let apiService : API
    private let databaseManager: Database
    
    var repoNameBehavior = BehaviorRelay<String>(value: "")
    
    var repoCount = 0
    
    private var reposModelSubject = PublishSubject<[Repo]>()
    
    var reposModelObservable : Observable<[Repo]> {
        return reposModelSubject
    }
    
    init(apiService: API = APIServices.shared) {
        self.apiService = apiService
        self.databaseManager = CoreDataManager.shared
    }
    
    func getData(for repoName:String, completion: @escaping (Repositories?) -> ()){
        var returnedObject : Repositories?
        apiService.fetch(for: repoName) {[weak self] (reposObject: Repositories?, error) in
            if let error = error {
                print("There was an error fetching your data from the API. Error is: \(error.localizedDescription)")
                return
            }
            if let safeReposObject = reposObject {
                if safeReposObject.total_count > 0 {
                    self?.reposModelSubject.onNext(safeReposObject.items)
                    self?.repoCount = safeReposObject.total_count
                    
                    
                    //Caching, unfortunately not working
                    //self?.databaseManager.save()
                }
                else {
                    print("There's no new data")
                }
                returnedObject = safeReposObject
            }
        }
        completion(returnedObject)
    }
    
    //Used when using the custom cell to fetch user's Image
    func fetchUserImage(url: String) -> UIImage {
        if let url = URL(string: url){
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    return image
                }
            }
        }
        return UIImage()
    }
}
