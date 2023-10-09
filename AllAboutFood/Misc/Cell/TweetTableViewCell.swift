//
//  TweetTableViewCell.swift
//  AllAboutFood
//
//  Created by Apiux on 28-09-23.
//

import UIKit
import Kingfisher

class TweetTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameUSerLabel: UILabel!
    @IBOutlet private weak var nicknameLable: UILabel!
    @IBOutlet private weak var tweetLabel: UILabel!
    @IBOutlet private weak var imageTweetView: UIImageView!
    @IBOutlet private weak var videoButton: UIButton!
    @IBOutlet private weak var dateLabel: UILabel!

    static let identifier = "FoodTableViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)

    var tweet: Tweet?{
        didSet {
            nameUSerLabel.text = tweet?.author?.names
            nicknameLable.text = tweet?.author?.nickname
            tweetLabel.text = tweet?.text
            if tweet?.hasImage ?? false {
                imageTweetView.isHidden = false
                imageTweetView.kf.setImage(with: tweet?.imageUrl, placeholder: UIImage(named: "icon"))
            }
            if tweet?.hasVideo ?? false {
                videoButton.isHidden = false
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        commonInit()
    }
    
    private func commonInit() {
        imageTweetView.isHidden = true
        videoButton.isHidden = true
        nameUSerLabel.text = ""
        nicknameLable.text = ""
        tweetLabel.text = ""
        dateLabel.text = ""
    }
}
