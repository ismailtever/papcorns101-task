//
//  CustomCell.swift
//  papcorn101
//
//  Created by Ismail Tever on 22.08.2023.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    static let identifier = "CustomCVCell"
    var movies = [MovieInfo]()
    
    let movieTime: UILabel = UILabel()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo") //resim url sini araştır.
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .yellow
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    let movieLabel: UILabel = {
        let movieLabel = UILabel()
        movieLabel.backgroundColor = .green
        movieLabel.textAlignment = .center
        return movieLabel
    }()
    let movieType: UILabel = {
        let movieType = UILabel()
        movieType.contentMode = .scaleAspectFit

        movieType.backgroundColor = .cyan
        movieType.textAlignment = .center
        return movieType
    }()
    let movieYear: UILabel = {
        let movieYear = UILabel()
        movieYear.contentMode = .scaleAspectFit

        movieYear.backgroundColor = .systemBlue
        movieYear.textAlignment = .center
        return movieYear
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .brown
        contentView.addSubview(imageView)
        contentView.addSubview(movieLabel)
        contentView.addSubview(movieType)
        contentView.addSubview(movieYear)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = CGRect(x: 0, y:-30, width: 150, height: 250)
//        contentView.snp.makeConstraints { make in
//            make.top.equalTo()
//        }
        imageView.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.frame.size.width-10,
                                 height: contentView.frame.size.height-50)
        movieLabel.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height-48,
                                  width: contentView.frame.size.width-10,
                                  height: 15)
        movieType.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height-32,
                                  width: contentView.frame.size.width-10,
                                  height: 15)
        movieYear.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height-17,
                                  width: contentView.frame.size.width-10,
                                  height: 15)
    }
    
}
