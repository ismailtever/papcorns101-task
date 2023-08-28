//
//  PostTVCell.swift
//  papcorn101
//
//  Created by Ismail Tever on 28.08.2023.
//

import UIKit

class PostTVCell: UITableViewCell {

    static let identifier = "PostTVCell"
    
    let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.backgroundColor = .red
        return userNameLabel
    }()
    let postCreatedTime: UILabel = {
        let postCreatedTime = UILabel()
        postCreatedTime.backgroundColor = .green
        return postCreatedTime
    }()
    let postComment: UILabel = {
        let postComment = UILabel()
        postComment.backgroundColor = .systemPink
        return postComment
    }()
    let postUserImageView: UIImageView = {
        let postUserImageView = UIImageView()
        postUserImageView.image = UIImage(systemName: "photo")
        postUserImageView.contentMode = .scaleAspectFill
        postUserImageView.backgroundColor = .yellow
        postUserImageView.clipsToBounds = true
        postUserImageView.layer.masksToBounds = true
        return postUserImageView
    }()
    let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.image = UIImage(systemName: "photo")
        postImageView.contentMode = .scaleAspectFill
        postImageView.backgroundColor = .systemBrown
        postImageView.clipsToBounds = true
        postImageView.layer.masksToBounds = true
        return postImageView
    }()
    let heartButton: UIButton = UIButton()
    let commentButton: UIButton = UIButton()
    let shareButton: UIButton = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func config() {
        contentView.addSubview(userNameLabel)
        contentView.addSubview(postCreatedTime)
        contentView.addSubview(postComment)
        contentView.addSubview(postUserImageView)
        contentView.addSubview(postImageView)
        contentView.addSubview(heartButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.clipsToBounds = true
    }

    override func layoutSubviews() {

        contentView.backgroundColor = .green
        contentView.frame = CGRect(x: 0, y:0, width:380 , height:450)
//        userNameLabel.snp.makeConstraints { make in
//            make.height.equalTo(150)
////            make.top.equalTo(contentView.snp.bottom)
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
        postUserImageView.frame = CGRect(x: 5,
                                          y: 2,
                                         width: 50,
                                          height: 50)
        postUserImageView.layer.cornerRadius = postUserImageView.frame.size.width/2

        userNameLabel.frame = CGRect(x: 63,
                                 y: 5,
                                 width: 200,
                                 height: 20)
        postCreatedTime.frame = CGRect(x: 63,
                                  y: 25,
                                  width: 200,
                                  height: 20)
        postComment.frame = CGRect(x: 5,
                                  y: 55,
                                  width: 300,
                                  height: 20)
        postImageView.frame = CGRect(x: 0,
                                  y: 85,
                                  width: 400,
                                  height: 350)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
