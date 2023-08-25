//
//  ViewController.swift
//  papcorn101
//
//  Created by Ismail Tever on 21.08.2023.
//

import UIKit
import Foundation
import SnapKit
import Alamofire

class HomeViewController: UIViewController {
    var movies = [MovieInfo]()

    private let labelTitle1: UILabel = UILabel()
    private let labelTitle2: UILabel = UILabel()
    private let recommendedViewButton: UIButton = UIButton()
    private let popularViewButton: UIButton = UIButton()
    let recommendedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv1.translatesAutoresizingMaskIntoConstraints = false
        cv1.register(RecommendedCVCell.self, forCellWithReuseIdentifier: RecommendedCVCell.identifier)
        return cv1
    }()
    let popularCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv2 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv2.translatesAutoresizingMaskIntoConstraints = false
        cv2.register(PopularCVCell.self, forCellWithReuseIdentifier: PopularCVCell.identifier)
        return cv2
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        Webservice.shared.fetchingAPIData { apiData in
            self.movies = apiData
            DispatchQueue.main.async {
                self.recommendedCollectionView.reloadData()
            }
        }
        Webservice.shared.fetchingAPIData { apiData in
            self.movies = apiData
            DispatchQueue.main.async {
                self.popularCollectionView.reloadData()
            }
        }
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
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.recommendedCollectionView {
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCVCell.identifier, for: indexPath) as! RecommendedCVCell
            cellA.layer.cornerRadius = 25
            if movies.count > 0 {
                let movieData = movies[indexPath.row]
                Webservice.shared.fetchImages(with: movieData.movieImage) { data in
                    cellA.imageView.image = UIImage(data: data)
                }
            cellA.movieLabel.text = movieData.movieTitle
            cellA.movieType.text = movieData.movieGenre
            cellA.movieYear.text = String(describing: movieData.movieYear!)
            }
            return cellA
        } else  {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCVCell.identifier, for: indexPath ) as! PopularCVCell
            cellB.layer.cornerRadius = 25
            if movies.count > 0 {
                let movieData = movies[indexPath.row]
                Webservice.shared.fetchImages(with: movieData.movieImage) { data in
                    cellB.pImageView.image = UIImage(data: data)
                    }
                cellB.pMovieLabel.text = movieData.movieTitle
                cellB.pMovieType.text = movieData.movieGenre
                cellB.pMovieYear.text = String(describing: movieData.movieYear!)
            }
            return cellB
        }
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
        recommendedCollectionView.backgroundColor = .gray
        recommendedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle1.snp.bottom).offset(5)
            make.left.right.equalTo(labelTitle1)
            make.height.greaterThanOrEqualTo(250)
        }
    }
    private func makePopularMovieCollectionView() {
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.backgroundColor = .systemYellow
        popularCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle2.snp.bottom).offset(5)
            make.left.right.equalTo(labelTitle2)
            make.height.greaterThanOrEqualTo(250)

        }
    }
}

