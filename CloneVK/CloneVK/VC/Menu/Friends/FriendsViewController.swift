//
//  FriendsViewController.swift
//  CloneVK
//
//  Created by Андрей Шкундалёв on 12.09.21.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.Cell.friend)
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Constants.Cell.friend, for: indexPath)
    }
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let user = cell as? FriendsTableViewCell {
            user.avatarImage.image = users[indexPath.row].avatar
            user.avatarImage.layer.cornerRadius = 40
            user.nameLabel.text = users[indexPath.row].name
            user.cityLabel.text = users[indexPath.row].city
            user.shadowView.layer.cornerRadius = 40
            user.shadowView.layer.shadowColor = UIColor.black.cgColor
            user.shadowView.layer.shadowOpacity = 0.8
            user.shadowView.layer.shadowOffset = CGSize.zero
            user.shadowView.layer.shadowRadius = 8
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "FriendCollection", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()
        if let vc = vc as? FriendCollectionViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            vc.id = indexPath.row
        }
    }
}
