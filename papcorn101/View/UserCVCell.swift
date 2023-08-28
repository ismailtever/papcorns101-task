//
//  UserCVCell.swift
//  papcorn101
//
//  Created by Ismail Tever on 28.08.2023.
//

import UIKit

class UserCVCell: UICollectionViewCell {
    
    static let identifier = "UserCVCell"

    let userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.image = UIImage(systemName: "photo")
        userImageView.contentMode = .scaleAspectFill
        userImageView.backgroundColor = .yellow
        userImageView.clipsToBounds = true
        userImageView.layer.masksToBounds = true
        
        userImageView.layer.borderWidth = 2
        userImageView.layer.borderColor = UIColor.link.cgColor
        return userImageView
    }()
    let userLabel: UILabel = {
        let userLabel = UILabel()
         userLabel.backgroundColor = .green
         userLabel.textAlignment = .center
        userLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return userLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(userImageView)
        contentView.addSubview(userLabel)
    }
    override func layoutSubviews() {
        userImageView.frame = CGRect(x: 25,
                                    y: 5,
                                    width: contentView.frame.size.width-50,
                                    height: contentView.frame.size.height-50)
        userLabel.frame = CGRect(x: 5,
                                 y: userImageView.frame.size.height+10,
                                 width: contentView.frame.size.width,
                                 height: contentView.frame.size.height-100)
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
