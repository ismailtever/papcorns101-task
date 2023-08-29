//
//  PostTVCell.swift
//  papcorn101
//
//  Created by Ismail Tever on 28.08.2023.
//

import UIKit

class PostTVCell: UITableViewCell {
//MARK: - Properties
    static let identifier = "PostTVCell"
    
    let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        return userNameLabel
    }()
    let postCreatedTime: UILabel = {
        let postCreatedTime = UILabel()
        return postCreatedTime
    }()
    let postComment: UILabel = {
        let postComment = UILabel()
        return postComment
    }()
    let postUserImageView: UIImageView = {
        let postUserImageView = UIImageView()
        postUserImageView.image = UIImage(systemName: "photo")
        postUserImageView.contentMode = .scaleAspectFill
        postUserImageView.clipsToBounds = true
        postUserImageView.layer.masksToBounds = true
        return postUserImageView
    }()
    let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.image = UIImage(systemName: "photo")
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        postImageView.layer.masksToBounds = true
        return postImageView
    }()
    let heartImage: UIImageView = {
        let heartImage = UIImageView()
        heartImage.image = UIImage(systemName: "heart")
        heartImage.contentMode = .scaleAspectFill
        heartImage.clipsToBounds = true
        heartImage.layer.masksToBounds = true
        return heartImage
    }()
    let heartLabel: UILabel = {
        let heartLabel = UILabel()
        return heartLabel
    }()
    let commentImage: UIImageView = {
        let commentImage = UIImageView()
        commentImage.image = UIImage(systemName: "message")
        commentImage.contentMode = .scaleAspectFill
        commentImage.clipsToBounds = true
        commentImage.layer.masksToBounds = true
        return commentImage
    }()
    let commentLabel: UILabel = {
        let commentLabel = UILabel()
        return commentLabel
    }()
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
        contentView.addSubview(heartImage)
        contentView.addSubview(heartLabel)
        contentView.addSubview(commentImage)
        contentView.addSubview(commentLabel)
        contentView.addSubview(shareButton)
        contentView.clipsToBounds = true
    }
    override func layoutSubviews() {
        contentView.frame = CGRect(x: 0, y:35, width:380 , height:450)
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
                                  y: 27,
                                  width: 200,
                                  height: 20)
        postComment.frame = CGRect(x: 5,
                                  y: 55,
                                  width: 300,
                                  height: 20)
        postImageView.frame = CGRect(x: 0,
                                  y: 85,
                                  width: 400,
                                  height: 300)
        heartImage.frame = CGRect(x: 15, y: 400, width: 30, height: 30)
        heartLabel.frame = CGRect(x: 50, y: 400, width: 30, height: 30)
        commentImage.frame = CGRect(x: 170, y: 400, width: 30, height: 30)
        commentLabel.frame = CGRect(x: 205, y: 400, width: 30, height: 30)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
