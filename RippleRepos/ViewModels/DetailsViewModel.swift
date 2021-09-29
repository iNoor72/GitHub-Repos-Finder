//
//  DetailsViewModel.swift
//  Ripple-Task
//
//  Created by Noor Walid on 24/09/2021.
//

import Foundation
import RxSwift
import RxCocoa

class DetailsViewModel {
    private var repoModelSubject = Observable<Repo>.empty()
    
    var repoObservable: Observable<Repo> {
        return repoModelSubject
    }
    var imageBehaviour = BehaviorRelay<UIImage>(value: UIImage())
    var usernameBehaviour = BehaviorRelay<String>(value: "")
    var repoNameBehaviour = BehaviorRelay<String>(value: "")
    var descriptionBehaviour = BehaviorRelay<String>(value: "")
    var repoLinkBehaviour = BehaviorRelay<String>(value: "")
    
    init(repo: Repo) {
        self.repoModelSubject = Observable.of(repo)
        self.imageBehaviour = BehaviorRelay.init(value: fetchUserImage(url: repo.owner.imageURL))
        self.usernameBehaviour = BehaviorRelay.init(value: repo.owner.name)
        self.repoNameBehaviour = BehaviorRelay.init(value: repo.repoPath)
        self.descriptionBehaviour = BehaviorRelay.init(value: repo.description ?? "No Description")
        self.repoLinkBehaviour = BehaviorRelay.init(value: repo.githubLink)
        
    }
    
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
    
    func openURL(for url: String) {
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
}
