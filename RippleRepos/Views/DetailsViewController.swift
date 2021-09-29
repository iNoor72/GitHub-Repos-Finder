//
//  DetailsViewController.swift
//  Ripple-Task
//
//  Created by Noor Walid on 24/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var openRepoButton: UIButton!
    
    var detailsViewModel : DetailsViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUserImageToViewModel()
        bindUsernameLabelToViewModel()
        bindRepoLabelToViewModel()
        bindDescriptionLabelToViewModel()
        bindButtonToViewModel()
    }
    
    func bindUserImageToViewModel() {
        userImage.rx.image.onNext(detailsViewModel?.imageBehaviour.value)
    }
    
    func bindUsernameLabelToViewModel() {
        usernameLabel.rx.text.onNext(detailsViewModel?.usernameBehaviour.value)
    }
    
    func bindRepoLabelToViewModel() {
        repoLabel.rx.text.onNext(detailsViewModel?.repoNameBehaviour.value)
    }
    
    func bindDescriptionLabelToViewModel() {
        descriptionLabel.rx.text.onNext(detailsViewModel?.descriptionBehaviour.value)
    }
    
    func bindButtonToViewModel() {
        openRepoButton.rx.tap.subscribe {[weak self] _ in
            self?.detailsViewModel?.openURL(for: self?.detailsViewModel?.repoLinkBehaviour.value ?? "")
        }.disposed(by: disposeBag)
    }
    
}
