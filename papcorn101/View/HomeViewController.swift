//
//  ViewController.swift
//  papcorn101
//
//  Created by Ismail Tever on 21.08.2023.
//

import UIKit
import Foundation
import SnapKit

class HomeViewController: UIViewController {

    private let labelTitle1: UILabel = UILabel()
    private let labelTitle2: UILabel = UILabel()
    private let recommendedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    private let popularCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure() {
        view.addSubview(labelTitle1)
        view.addSubview(recommendedCollectionView)
        view.addSubview(labelTitle2)
        view.addSubview(popularCollectionView)
        view.backgroundColor = .white

        
        makeRecommendedLabel()
        makeRecommendedMovieCollectionView()
        makePopularLabel()
        makePopularMovieCollectionView()
    }

}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    private func makeRecommendedLabel() {
        labelTitle1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
        labelTitle1.text = "Recomended Movie"
    }
    private func makePopularLabel() {
        labelTitle2.snp.makeConstraints { make in
            make.top.equalTo(recommendedCollectionView.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
        labelTitle2.text = "Popular Movie"

    }

    private func makeRecommendedMovieCollectionView() {
        recommendedCollectionView.delegate = self
        recommendedCollectionView.dataSource = self
        recommendedCollectionView.backgroundColor = .blue
        recommendedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle1.snp.bottom).offset(5)
            make.left.right.equalTo(labelTitle1)
            make.height.greaterThanOrEqualTo(250)
        }
    }
    private func makePopularMovieCollectionView() {
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.backgroundColor = .blue
        popularCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle2.snp.bottom).offset(5)
            make.left.right.equalTo(labelTitle2)
            make.height.greaterThanOrEqualTo(250)

        }
    }
}

