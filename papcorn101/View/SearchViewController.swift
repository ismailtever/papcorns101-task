//
//  SearchViewController.swift
//  papcorn101
//
//  Created by Ismail Tever on 22.08.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    var users = [UserInfo]()

    private let labelTitle3: UILabel = UILabel()
    private let viewButton: UIButton = UIButton()
    private let userCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UserCVCell.self, forCellWithReuseIdentifier: UserCVCell.identifier)
        cv.backgroundColor = .orange
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        Webservice.shared.fetchingUserData { apiData in
            self.users = apiData
            DispatchQueue.main.async {
                self.userCollectionView.reloadData()
            }
        }
    }
    func configure() {
        view.addSubview(labelTitle3)
        view.addSubview(userCollectionView)
        view.backgroundColor = .cyan
        makeStoryLabel()
        makeUserCollectionView()
    }
}
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
