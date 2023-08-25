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
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        return cv
    }()
    let popularCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
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
        
    }

    func configure() {
        view.addSubview(labelTitle1)
        view.addSubview(recommendedCollectionView)
        view.addSubview(labelTitle2)
        view.addSubview(popularCollectionView)
        view.backgroundColor = .white

        
        makeRecommendedLabel()
        makeRecommendedMovieCollectionView()
//        makePopularLabel()
//        makePopularMovieCollectionView()
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {return UICollectionViewCell()}
        cell.layer.cornerRadius = 25
        if movies.count > 0 {
            let movieData = movies[indexPath.row]
            Webservice.shared.fetchImages(with: movieData.movieImage) { data in
                cell.imageView.image = UIImage(data: data)
            }
            cell.movieLabel.text = movieData.movieTitle
            cell.movieType.text = movieData.movieGenre
            cell.movieYear.text = String(describing: movieData.movieYear!)

        }
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
        popularCollectionView.backgroundColor = .gray
        popularCollectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle2.snp.bottom).offset(5)
            make.left.right.equalTo(labelTitle2)
            make.height.greaterThanOrEqualTo(250)

        }
    }
}

