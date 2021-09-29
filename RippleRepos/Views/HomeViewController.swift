//
//  ViewController.swift
//  Ripple-Task
//
//  Created by Noor Walid on 24/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var fetchButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyView: UIView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    
    let homeViewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.layer.cornerRadius = 12.0
        fetchButton.layer.cornerRadius = 12.0
        loadingIndicator.isHidden = true
        bindSearchBarToViewModel()
        subscribeToFetchButton()
        naviagteToRepo()
    }
    
    func setTableView() {
        tableView.register(UINib(nibName: "RepoCell", bundle: nil), forCellReuseIdentifier: Constants.customCellID)
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        //Get CoreData file from Finder
        //        if let directoryLocation = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last {             print("Documents Directory: \(directoryLocation)Application Support")
        //        }
    }
    
    func bindSearchBarToViewModel(){
        searchBar.rx.text.orEmpty.bind(to: homeViewModel.repoNameBehavior)
            .disposed(by: disposeBag)
    }
    
    func subscribeToFetchButton() {
        fetchButton.rx.tap.subscribe(onNext: {[weak self] _ in
            guard let self = self else { return }
            self.homeViewModel.getData(for: self.homeViewModel.repoNameBehavior.value) {
                [weak self] _ in
                self?.loadingIndicator.isHidden = false
                self?.loadingIndicator.startAnimating()
            }
            
            self.updateTableView()
        }).disposed(by: disposeBag)
    }
    
    func updateTableView() {
        setTableView()
        homeViewModel.reposModelObservable.bind(to: tableView.rx.items(cellIdentifier: Constants.customCellID, cellType: RepoCell.self)) {[weak self]
            index, repo, cell in
            self?.emptyView.isHidden = true
            self?.loadingIndicator.isHidden = true
            self?.loadingIndicator.stopAnimating()
            
            cell.backgroundColor = (index%2 == 0 ? UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1) : UIColor(white: 0.6, alpha: 1))
            cell.userImage.image = self?.homeViewModel.fetchUserImage(url: repo.owner.imageURL)
            cell.usernameLabel.text = repo.owner.name
            let desc = repo.description
            if desc?.count ?? 0 > 30 {
                //For long descriptions, fetch the first 30 characters and then append "..." at the end
                guard let firstIndex = desc?.startIndex else { return }
                guard let startIndex = desc?.index(firstIndex, offsetBy: 30) else { return }
                guard let endIndex = desc?.endIndex else { return }
                cell.descriptionLabel.text = desc?.replacingCharacters(in: startIndex..<endIndex, with: "...")
            }
            else {
                cell.descriptionLabel.text = repo.description ?? "No description"
            }
        }.disposed(by: disposeBag)
        
        //If there's no data or fetching non-existing repos:
        emptyView.isHidden = false
    }
    
    func naviagteToRepo() {
        tableView.rx.modelSelected(Repo.self).subscribe(onNext: {[weak self] repo in
            let destination = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(identifier: Constants.detailsViewControllerID) as! DetailsViewController
            destination.detailsViewModel = DetailsViewModel(repo: repo)
            self?.navigationController?.pushViewController(destination, animated: true)
        }).disposed(by: disposeBag)
        
    }
}
