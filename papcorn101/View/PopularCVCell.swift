//
//  PopularCVCell.swift
//  papcorn101
//
//  Created by Ismail Tever on 25.08.2023.
//

import Foundation
import UIKit

class PopularCVCell: UICollectionViewCell {
    
    static let identifier = "PCustomCVCell"
    
    let pImageView: UIImageView = {
        let pImageView = UIImageView()
        pImageView.image = UIImage(systemName: "photo")
        pImageView.contentMode = .scaleAspectFill
        pImageView.backgroundColor = .orange
        pImageView.clipsToBounds = true
        pImageView.layer.cornerRadius = 25
        return pImageView
    }()
    let pMovieLabel: UILabel = {
        let pMovieLabel = UILabel()
        pMovieLabel.backgroundColor = .yellow
        pMovieLabel.textAlignment = .left
        pMovieLabel.font = UIFont.boldSystemFont(ofSize: 16)
        return pMovieLabel
    }()
    let pMovieType: UILabel = {
        let pMovieType = UILabel()
        pMovieType.contentMode = .scaleAspectFit
        pMovieType.font = UIFont.systemFont(ofSize: 15)
        pMovieType.backgroundColor = .lightGray
        pMovieType.textAlignment = .left
        return pMovieType
    }()
    let pMovieYear: UILabel = {
        let pMovieYear = UILabel()
        pMovieYear.contentMode = .scaleAspectFit
        pMovieYear.font = UIFont.systemFont(ofSize: 15)
        pMovieYear.backgroundColor = .magenta
        pMovieYear.textAlignment = .left
        return pMovieYear
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.backgroundColor = .black
        contentView.addSubview(pImageView)
        contentView.addSubview(pMovieLabel)
        contentView.addSubview(pMovieType)
        contentView.addSubview(pMovieYear)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = CGRect(x: 0, y:-30, width: 150, height: 250)

        pImageView.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.frame.size.width-10,
                                 height: contentView.frame.size.height-50)
        pMovieLabel.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height-48,
                                  width: contentView.frame.size.width-10,
                                  height: 15)
        pMovieType.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height-32,
                                  width: contentView.frame.size.width-10,
                                  height: 15)
        pMovieYear.frame = CGRect(x: 5,
                                  y: contentView.frame.size.height-17,
                                  width: contentView.frame.size.width-10,
                                  height: 15)
    }
    
}
