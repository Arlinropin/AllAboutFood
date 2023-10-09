//
//  HomeViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 24-09-23.
//

import UIKit
import NotificationBannerSwift

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TweetTableViewCell.nib, forCellReuseIdentifier: TweetTableViewCell.identifier)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getTweets()
    }

    private func getTweets() {
        loader.play(on: self)
        manager?.getPosts { [weak self] response in
            self?.loader.stop()
            switch response {
            case .success(data: let data):
                self?.tweets = data
                self?.tableView.reloadData()
            case .error(error: let error):
                switch error {
                case .api(let error):
                    NotificationBanner(
                        title: "I'm sorry",
                        subtitle: "\(error).",
                        style: .danger).show()
                case .general(_):
                    NotificationBanner(
                        title: "I'm sorry",
                        subtitle: "Something is broken. Try again later!",
                        style: .danger).show()
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        cell.tweet = tweets[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
