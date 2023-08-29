//
//  SearchViewController.swift
//  papcorn101
//
//  Created by Ismail Tever on 22.08.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Properties
    var users = [UserInfo]()
    
    private let labelTitle3: UILabel = UILabel()
    private let archiveButton: UIButton = {
        let archiveButton = UIButton()
        archiveButton.setTitle("View Archive", for: .normal)
        archiveButton.titleLabel?.textColor = .blue
        archiveButton.tintColor = .black
        return archiveButton
    }()
    private let userCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UserCVCell.self, forCellWithReuseIdentifier: UserCVCell.identifier)
        return cv
    }()
    private let postTableView: UITableView = UITableView()
//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        Webservice.shared.fetchingUserData { apiData in
            self.users = apiData
            DispatchQueue.main.async {
                self.userCollectionView.reloadData()
                self.postTableView.reloadData()
            }
        }
    }
    override func viewDidLayoutSubviews() {
        postTableView.frame = CGRect(x: 10, y: 300, width: userCollectionView.frame.width, height: 465)
    }
    func configure() {
        view.backgroundColor = .white
        view.addSubview(labelTitle3)
        view.addSubview(userCollectionView)
        view.addSubview(postTableView)
        makeStoryLabel()
        makeUserCollectionView()
        setupTableView()
        setupBarItem()
    }
    func setupTableView(){
        postTableView.register(PostTVCell.self, forCellReuseIdentifier: PostTVCell.identifier)
        postTableView.delegate = self
        postTableView.dataSource = self
    }
    func setupBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: nil, action: nil)
    }
}
//MARK: - Extensions
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cellUser = collectionView.dequeueReusableCell(withReuseIdentifier: UserCVCell.identifier, for: indexPath) as! UserCVCell
            if users.count > 0 {
                let userData = users[indexPath.row]
                Webservice.shared.fetchImages(with: userData.userImageUrl) { data in
                    cellUser.userImageView.image = UIImage(data: data)
                }
                cellUser.userLabel.text = userData.userFullName
            }
            return cellUser
    }
    private func makeStoryLabel() {
        labelTitle3.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalTo(view).offset(-10)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
        }
        labelTitle3.text = "Stories"
        labelTitle3.font = .boldSystemFont(ofSize: 16)
    }
    private func makeArchiveButton() {
        archiveButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalTo(view).offset(150)
            make.left.equalTo(view).offset(-150)
            make.height.greaterThanOrEqualTo(50)
        }
    }
    private func makeUserCollectionView() {
        userCollectionView.delegate = self
        userCollectionView.dataSource = self
        userCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle3.snp.bottom).offset(5)
            make.left.right.equalTo(labelTitle3)
            make.height.greaterThanOrEqualTo(120)
        }
    }
}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: PostTVCell.identifier, for: indexPath) as! PostTVCell
        let userData = users[indexPath.row]
        postCell.userNameLabel.text = userData.userFullName
        postCell.postCreatedTime.text = userData.createdAt
        postCell.postComment.text = userData.postMessage
        Webservice.shared.fetchImages(with: userData.userImageUrl) { data in
            postCell.postUserImageView.image = UIImage(data: data)
        }
        Webservice.shared.fetchImages(with: userData.postImage) { data in
            postCell.postImageView.image = UIImage(data: data)
        }
        postCell.heartLabel.text = String(describing: userData.likeCount!)
        postCell.commentLabel.text = String(describing: userData.commentCount!)
        return postCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
    }
}
